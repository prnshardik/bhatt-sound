<div class="sidebar" data-color="white" data-active-color="danger">
    <div class="logo">
        <a href="{{ route('dashboard') }}" class="simple-text logo-mini">
            <div class="logo-image-small">
                <img src="{{ asset('qr_logo.png') }}">
            </div>
        </a>
        <a href="{{ route('dashboard') }}" class="simple-text logo-normal"><img src="{{ asset('qr_logo.png') }}" style="max-width: 50%;" ></a>
    </div>
    <div class="sidebar-wrapper">
        <ul class="nav">
            <li class="{{ Request::is('dashboard*') ? 'active' : '' }}">
                <a href="{{ route('dashboard') }}">
                    <i class="nc-icon nc-bank"></i>
                    <p>Dashboard</p>
                </a>
            </li>
            <li class="{{ Request::is('users*') ? 'active' : '' }}">
                <a href="{{ route('users') }}">
                    <i class="fa fa-users"></i>
                    <p>Users</p>
                </a>
            </li>
            <li class="{{ Request::is('items-categories*') ? 'active' : '' }}">
                <a href="{{ route('items.categories') }}">
                    <i class="fa fa-bars"></i>
                    <p>Items Categories</p>
                </a>
            </li>
            <li class="{{ (Request::is('items*') && !Request::is('items-categories*') && !Request::is('items-inventories*')) ? 'active' : '' }}">
                <a href="{{ route('items') }}">
                    <i class="fa fa-cubes"></i>
                    <p>Items</p>
                </a>
            </li>
            <li class="{{ Request::is('items-inventories*') ? 'active' : '' }}">
                <a href="{{ route('items.inventories') }}">
                    <i class="fa fa-music"></i>
                    <p>Items Inventories</p>
                </a>
            </li>
            <li class="{{ Request::is('sub-items-categories*') ? 'active' : '' }}">
                <a href="{{ route('sub.items.categories') }}">
                    <i class="fa fa-bars"></i>
                    <p>Sub Items Categories</p>
                </a>
            </li>
            <li class="{{ (Request::is('sub-items*') && !Request::is('sub-items-categories*') && !Request::is('sub-items-inventories*')) ? 'active' : '' }}">
                <a href="{{ route('sub.items') }}">
                    <i class="fa fa-cubes"></i>
                    <p>Sub Items</p>
                </a>
            </li>
            <li class="{{ Request::is('sub-items-inventories*') ? 'active' : '' }}">
                <a href="{{ route('sub.items.inventories') }}">
                    <i class="fa fa-music"></i>
                    <p>Sub Items Inventories</p>
                </a>
            </li>
        </ul>
    </div>
</div>