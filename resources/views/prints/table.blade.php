@php $array = []; @endphp

@foreach($selected as $k => $v)
    @php array_push($array, $v); @endphp
@endforeach

@foreach($data as $row)
    <tr>
        <td>
            <div class="form-check">
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-input option" name="option[]" value="{{ $row->id }}"
                        @if(!empty($array) && in_array($row->id, $array)) checked @endif>
                    <span class="form-check-sign"></span>
                </label>
            </div>
        </td>
        <td>{{ $row->name }}</td>
        <td><input type="number" name="height[]" min="0" class="form-control height" ></td>
        <td><input type="number" name="width[]" min="0" class="form-control width" ></td>
        <td><input type="number" name="quantity[]" min="0" class="form-control quantity" ></td>
    </tr>
@endforeach
