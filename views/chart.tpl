<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, inital-scale=1.0">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Karfa</title>
	<link rel="stylesheet" type="text/css" href="/static/style.css">
</head>
<body>
	<h2>Karfan:</h2>
	
	% from bottle import *
	% from beaker.middleware import SessionMiddleware
	% bs = request.environ.get('beaker.session')
	% empty = True

	% for i in range(6):
		% if bs.get(str(i)):
			% empty = False
		% end
	% end
	% if empty:
		<h3>Karfan er tóm, farðu að versla</h3>
	% else:
		<table>
		<tr>
			<th>Vara:</th>
			<th>Verð:</th>
			<th>Fjarlæga vöru</th>
		</tr>
		% sum = 0
		% for i in range(6):
			% if bs.get(str(i)):
				% sum = sum + int(val[int(i)]['price'])
				<tr>
					<td>{{val[int(i)]['name']}}</td>
					<td>{{val[int(i)]['price']}}</td>
					<td><a href="/del/{{i}}">Eyða</a></td>
				</tr>
			% end
		% end
		<tr>
			<td><b>Samtals</b></td>
			<td><b>{{sum}} Kr.</b></td>
			<td><a href="/delall">Tæma</a></td>
		</tr>
		</table>
	% end
	<h4>
		<a href="/">Aftur á verslun</a>
	</h4>


</body>
</html>
