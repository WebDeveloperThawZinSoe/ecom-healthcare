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
            <i class="anticon anticon-plus"></i> Add Delivery
        </button>

        <div class="mt-3">
            <table class="table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Currency Symbol</th>
                        <th>Delivery Price</th>
                        <th>Minimum Price</th>
                        <th>Note</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($deliveries as $key => $delivery)
                    <tr>
                        <td>{{ ++$key }}</td>
                        <td>{{ $delivery->currency }}</td>
                        <td>{{ $delivery->deli_price }}</td>
                        <td>{{ $delivery->mini_price }}</td>
                        <td>{{ $delivery->note }}</td>
                        <td>
                            <button class="btn btn-warning btn-edit" 
                                data-id="{{ $delivery->id }}" 
                                data-currency="{{ $delivery->currency }}"
                                data-deli_price="{{ $delivery->deli_price }}"
                                data-mini_price="{{ $delivery->mini_price }}"
                                data-note="{{ $delivery->note }}"
                                data-toggle="modal" 
                                data-target="#editModal">
                                <i class="anticon anticon-edit"></i>
                            </button>

                            <form action="{{ route('admin.delivery.destroy', $delivery->id) }}" method="POST" class="d-inline">
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

        <!-- Create Delivery Modal -->
        <div class="modal fade" id="createModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Delivery Setting</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="{{ route('admin.delivery.store') }}" method="POST">
                            @csrf
                            <div class="form-group">
                                <label>Currency *</label>
                                <select class="form-control" name="currency" required>
                                    <option value="">Select Currency</option>
                                    @foreach($currencies as $currency)
                                    <option value="{{ $currency->code }}">{{ $currency->name }} ({{ $currency->symbol }})</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Delivery Price *</label>
                                <input type="number" step="0.01" class="form-control" name="deli_price" required>
                            </div>
                            <div class="form-group">
                                <label>Minimum Price *</label>
                                <input type="number" step="0.01" class="form-control" name="mini_price" required>
                            </div>
                            <div class="form-group">
                                <label>Note</label>
                                <textarea class="form-control" name="note"></textarea>
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

        <!-- Edit Delivery Modal -->
        <div class="modal fade" id="editModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Delivery Setting</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form id="editForm" method="POST">
                            @csrf
                            @method('PUT')
                            <input type="hidden" name="delivery_id" id="edit_delivery_id">
                            <div class="form-group">
                                <label>Currency *</label>
                                <select class="form-control" name="currency" id="edit_currency" required>
                                    <option value="">Select Currency</option>
                                    @foreach($currencies as $currency)
                                    <option value="{{ $currency->code }}">{{ $currency->name }} ({{ $currency->symbol }})</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Delivery Price *</label>
                                <input type="number" step="0.01" class="form-control" name="deli_price" id="edit_deli_price" required>
                            </div>
                            <div class="form-group">
                                <label>Minimum Price *</label>
                                <input type="number" step="0.01" class="form-control" name="mini_price" id="edit_mini_price" required>
                            </div>
                            <div class="form-group">
                                <label>Note</label>
                                <textarea class="form-control" name="note" id="edit_note"></textarea>
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

<!-- jQuery Script to Handle Edit Modal Data -->
<script>
$(document).ready(function() {
    $('.btn-edit').click(function() {
        var id = $(this).data('id');
        var currency = $(this).data('currency');
        var deli_price = $(this).data('deli_price');
        var mini_price = $(this).data('mini_price');
        var note = $(this).data('note');

        $('#edit_delivery_id').val(id);
        $('#edit_currency').val(currency);
        $('#edit_deli_price').val(deli_price);
        $('#edit_mini_price').val(mini_price);
        $('#edit_note').val(note);

        // Use Laravel's named route dynamically
        var updateUrl = "{{ route('admin.delivery.update', ':id') }}";
        updateUrl = updateUrl.replace(':id', id);
        $('#editForm').attr('action', updateUrl);
    });
});

</script>

@endsection
