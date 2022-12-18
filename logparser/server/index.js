const fs = require('fs').promises;
const path = require('path');
const express = require('express');

const htmlTemplate = require('./htmlTemplate');

const app = express();
const port = 3000;

const logspath = path.resolve(process.cwd(), '../logs/');

app.get('/getlogfiles', async (req, res) => {
	const logfiles = {};
	const files = await fs.readdir(logspath);

	for (let f of files) {
		try {
			logfiles[f] = JSON.parse(await fs.readFile(path.join(logspath, f), {encoding: 'utf8'}));
		} catch (e) {}
	}

	res.setHeader('Content-Type', 'application/json');
	res.send(logfiles);
});

app.get('/', (req, res) => {
	res.send(htmlTemplate());
});

app.listen(port, () => console.log(`Listening on port ${port}`));
