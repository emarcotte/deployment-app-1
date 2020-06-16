const express = require('express');
const app = express();
const port = 3000;

app.get('/', (_req, res) => {
	if(process.env['CRASH']) {
		throw new Error(process.env['CRASH']);
	}
	res.send(`Hello World! ${process.env['EXTRA']}`);
});

app.listen(port);
