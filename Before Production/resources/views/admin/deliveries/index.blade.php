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
            <i class="anticon anticon-plus"></i> Add delivery
        </button>

        <div class="mt-3">
            <table class="table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Currency Symbol</th>
                        <th>Deli Price</th>
                        <th>Mini Price</th>
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
                           
                            <form action="{{ route('admin.delivery.destroy', $delivery->id) }}" method="POST"
                                class="d-inline">
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

        <!-- Create delivery Modal -->
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
                                    <option value="{{ $currency->code }}">{{ $currency->name }}
                                        ({{ $currency->symbol }})</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Delivery Price *</label>
                                <input type="text" class="form-control" name="deli_price" required>
                            </div>
                            <div class="form-group">
                                <label>Minimum Price *</label>
                                <input type="text" class="form-control" name="mini_price" required>
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


    </div>
</div>



@endsection