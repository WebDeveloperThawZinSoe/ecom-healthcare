@extends('layouts.admin')

@section('body')
<div class="card">
    <div class="card-body">
        @if (session('status'))
        <div class="alert alert-success alert-dismissible fade show">
            <strong>Success!</strong> {{ session('status') }}
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        @endif

        @if ($errors->any())
        <div class="alert alert-danger alert-dismissible fade show">
            <strong>Error!</strong> Please check the form below for errors.
            <button type="button" class="close" data-dismiss="alert">&times;</button>
            <ul>
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif

        <button class="btn btn-primary" data-toggle="modal" data-target="#createModal">
            <i class="anticon anticon-plus"></i> Add Currency
        </button>

        <div class="mt-3">
            <table class="table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Code</th>
                        <th>Symbol</th>
                        <th>Exchange Rate ( Base On 1 USD )</th>
                        <th>Created At</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($currencies as $key => $currency)
                    <tr>
                        <td>{{ ++$key }}</td>
                        <td>{{ $currency->name }}</td>
                        <td>{{ $currency->code }}</td>
                        <td>{{ $currency->symbol }}</td>
                        <td>{{ $currency->exchange_rate }}</td>
                        <td>{{ $currency->created_at->format('F j, Y, g:i a') }}</td>
                        <td>
                            <button class="btn btn-warning edit-btn" data-id="{{ $currency->id }}" 
                                    data-name="{{ $currency->name }}" data-code="{{ $currency->code }}"
                                    data-symbol="{{ $currency->symbol }}" data-exchange_rate="{{ $currency->exchange_rate }}"
                                    data-toggle="modal" data-target="#editModal">
                                <i class="anticon anticon-edit"></i>
                            </button>
                            <form action="{{ route('admin.currency.destroy', $currency->id) }}" method="POST" class="d-inline">
                                @csrf
                                @method('DELETE')
                                <button type="submit" onclick="return confirm('Are you sure?')" class="btn btn-danger">
                                    <i class="anticon anticon-delete"></i>
                                </button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <!-- Create Currency Modal -->
        <div class="modal fade" id="createModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Currency</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="{{ route('admin.currency.store') }}" method="POST">
                            @csrf
                            <div class="form-group">
                                <label>Name *</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>
                            <div class="form-group">
                                <label>Code *</label>
                                <input type="text" class="form-control" name="code" required>
                            </div>
                            <div class="form-group">
                                <label>Symbol</label>
                                <input type="text" class="form-control" name="symbol">
                            </div>
                            <div class="form-group">
                                <label>Exchange Rate *</label>
                                <input type="text" class="form-control" name="exchange_rate" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Create</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Currency Modal -->
        <div class="modal fade" id="editModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Currency</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form id="edit-form" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="form-group">
                                <label>Name *</label>
                                <input type="text" class="form-control" name="name" id="edit-name" required>
                            </div>
                            <div class="form-group">
                                <label>Code *</label>
                                <input type="text" class="form-control" name="code" id="edit-code" required>
                            </div>
                            <div class="form-group">
                                <label>Symbol</label>
                                <input type="text" class="form-control" name="symbol" id="edit-symbol">
                            </div>
                            <div class="form-group">
                                <label>Exchange Rate *</label>
                                <input type="text" class="form-control" name="exchange_rate" id="edit-exchange_rate" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

<script>
    $('.edit-btn').click(function() {
        $('#edit-form').attr('action', '/admin/currency/update/' + $(this).data('id'));
        $('#edit-name').val($(this).data('name'));
        $('#edit-code').val($(this).data('code'));
        $('#edit-symbol').val($(this).data('symbol'));
        $('#edit-exchange_rate').val($(this).data('exchange_rate'));
    });
</script>
@endsection
