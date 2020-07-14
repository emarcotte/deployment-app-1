const express = require('express');
const app = express();
const port = 3000;

if(process.env['CRASH_ON_BOOT']) {
	throw new Error("CRASH_ON_BOOT is set");
}

app.get('/', (_req, res) => {
	if(process.env['CRASH_ON_RENDER']) {
		throw new Error(process.env['CRASH']);
	}
	res.send(`Hello World! ${process.env['EXTRA']} ${process.env['HELLO']}`);
});

app.listen(port);
