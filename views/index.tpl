<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Verslun</title>
	<link rel="stylesheet" type="text/css" href="/static/style.css">
</head>
<body>
	% from bottle import *
	% from beaker.middleware import SessionMiddleware
	% bs = request.environ.get('beaker.session')
	<h1>Veforritun</h1>
	<div class="grid-container">
		<div>
			<h3>Jakki</h3>
			<a href="/chart/0">
				<img src="/static/mynd1.jpg"></a>
			<h4>Verð: 25000</h4>
		</div>
		<div>
			<h3>Peysa</h3>
			<a href="/chart/1">
				<img src="/static/mynd2.jpg"></a>
			<h4>Verð: 15000</h4>
		</div>
		<div>
			<h3>Kjóll</h3>
			<a href="/chart/2">
				<img src="/static/mynd3.jpg"></a>
			<h4>Verð: 30000</h4>
		</div>
		<div>
			<h3>Nærbuxur</h3>
			<a href="/chart/3">
				<img src="/static/mynd4.jpg"></a>
			<h4>Verð: 5000</h4>
		</div>
		<div>
			<h3>Samfestingur</h3>
			<a href="/chart/4">
				<img src="/static/mynd5.jpg"></a>
			<h4>Verð: 30000</h4>
		</div>
		<div>
			<h3>Jakkaföt</h3>
			<a href="/chart/5">
				<img src="/static/mynd6.jpg"></a>
			<h4>Verð: 40000</h4>
		</div>

	</div>
	<%
		from bottle import *
		from beaker.middleware import SessionMiddleware
		bs = request.environ.get('beaker.session')
		cnt = 0
		for i in range(6):
			if bs.get(str(i)):
				cnt += 1
			end
		end
	%>
	<aside class="karfa">
		( {{cnt}} )
		<a href="/chart" title="Skoda korfu"><img src="/static/cart.png"></a>
	</aside>

</body>
</html>
