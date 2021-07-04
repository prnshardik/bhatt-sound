@foreach($data as $row)
    <tr>
        <td>
            <div class="form-check">
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-input sub_inventories">
                    <span class="form-check-sign"></span>
                </label>
            </div>
        </td>
        <td>{{ $row->title }}</td>
        <td>{{ $row->sub_items }}</td>
    </tr>
@endforeach
