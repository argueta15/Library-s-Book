@extends('layouts.app')

@section('title', 'The Library.')

@section('content')
<div id="app">
	<v-app dark>
    	<router-view />
    </v-app>
</div>
@endsection