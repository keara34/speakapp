<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/dropdowns-enhancement.css">
	<link rel="stylesheet" href="/css/styles.css">
	<script type="text/javascript" src="/js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/dropdowns-enhancement.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
	<title>{{Auth::user()->profile->firstname}}'s profile</title>
</head>
<body>
	@include('tools.topbar')
<div class="container">
	@yield('content')
</div>
</body>
</html>