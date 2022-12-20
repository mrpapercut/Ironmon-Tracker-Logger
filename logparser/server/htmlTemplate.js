module.exports = (logfiles) => `<!doctype html>
<html>
<head>
<style>
table {
	border: 1px solid;
	border-collapse: collapse;
}

th, td {
	border: 1px solid;
}
</style>
</head>
<body>
<table id="results">
<thead>
	<tr>
		<th>Seed</th>
		<th>Trainer ID</th>
		<th>Battles (total/trainers/wild)</th>
		<th>Ball chosen</th>
		<th>Current mon</th>
		<th>Current name</th>
		<th>Current level</th>
		<th>Current bst</th>
		<th>Current status</th>
		<th>HP</th>
		<th>Current abilities</th>
		<th>Current moves</th>
		<th>Which mon</th>
		<th>Healing items</th>
		<th>Location</th>
		<th>Enemy</th>
		<th>Enemy mon</th>
		<th>Enemy level</th>
		<th>Enemy bst</th>
		<th>Enemy status</th>
		<th>Enemy HP</th>
		<th>Enemy abilities</th>
		<th>Enemy moves</th>
		<th>Last used move</th>
		<th>Last move dmg</th>
	</tr>
</thead>
<tbody>
</tbody>
</table>
<script>
const table = document.getElementById('results');
const tbody = table.querySelector('tbody');

const gettd = str => {
	const tr = document.createElement('td');
	tr.innerHTML = str;
	return tr;
}

const getEnemyChar = lf => {
    const possibleRivalLocations = [
        "Oak's Lab",
        'Route 22',
        'Cerulean City',
        'S.S. Anne 2F',
        'Pokémon Tower 2F',
        'Silph Co. 7F',
        'Indigo Plateau'
    ];

    const lastEncounter = lf.encounters[lf.encounters.length - 1];
    const enemyMon = lastEncounter.enemyMon;

    let enemyChar = '';

    if (lf.rivalID === enemyMon.trainerID && possibleRivalLocations.includes(lastEncounter.location)) {
        enemyChar = 'Rival';
    } else if (lastEncounter.isWildEncounter) {
        enemyChar = 'Wild';
    } else {
        const uniqueEncounters = [];
        lf.encounters.filter(e => e.location === lastEncounter.location && e.isWildEncounter === false)
        .forEach(e => {
            if (!uniqueEncounters.includes(e.battleID)) {
                uniqueEncounters.push(e.battleID);
            }
        });

        enemyChar = lastEncounter.location + ' #' + uniqueEncounters.length;
    }

    return enemyChar;
}

const getLogs = async () => {
	const data = await fetch('http://localhost:3000/getlogfiles');
	const logfiles = await data.json();

	const lfkeys = Object.keys(logfiles).sort().reverse()

	tbody.innerHTML = null;

	lfkeys.forEach(file => {
		const lf = logfiles[file];
		const tr = document.createElement('tr');

		let curMon = 'Unknown';
		if (lf.currentMon && lf.currentMon.personality) {
			const curMonPersonality = lf.currentMon.personality;
			if (lf.starterMon && lf.starterMon.personality === curMonPersonality) {
				curMon = 'Starter';
			} else if (lf.pivotMon && lf.pivotMon.personality === curMonPersonality) {
				curMon = 'Pivot';
			} else if (lf.evolutionMon && lf.evolutionMon.personality === curMonPersonality) {
				curMon = 'Evolution';
			}
		}

		const rowdata = [
			lf.currentSeed,
			lf.trainerID,
			[lf.totalBattles, lf.totalBattles - lf.totalWildBattles, lf.totalWildBattles].join('/'),
			lf.ballChosen,
		];

		if (lf.currentMon) {
			[
				lf.currentMon.name,
				'', // lf.currentMon.nickname
				lf.currentMon.level,
				lf.currentMon.bst,
				lf.currentMon.statusName,
				lf.currentMon.curHP + '/' + lf.currentMon.stats.hp,
				lf.currentMon.abilityNames?.filter((a, i) => lf.currentMon.abilityNames.indexOf(a) === i).join(', ') || '',
				lf.currentMon.moves.map(m => m.name).join(', '),
				curMon,
				Object.keys(lf.healingItems).map(i => i + ': ' + lf.healingItems[i]).join(',<br>')
			].forEach(d => rowdata.push(d))
		}

		const lastEncounter = lf.encounters[lf.encounters.length - 1];
		if (lastEncounter) {
			rowdata.push(lastEncounter.location);

			const enemyMon = lastEncounter.enemyMon;
			if (enemyMon) {
				const enemyChar = getEnemyChar(lf);

				[
					enemyChar,
					enemyMon.name || '',
					enemyMon.level || '',
					enemyMon.bst || '',
					enemyMon.statusName || '',
					enemyMon.curHP || '',
					enemyMon.abilityNames?.filter((a, i) => enemyMon.abilityNames.indexOf(a) === i).join(', ') || '',
					enemyMon.moves.map(m => m.name).join(', ') || '',
				].forEach(d => rowdata.push(d))
			}

			[
				lastEncounter.lastUsedMove || '',
				lastEncounter.lastUsedMoveDamage
			].forEach(d => rowdata.push(d));
		}

		rowdata.forEach(t => tr.appendChild(gettd(t)));

		tbody.appendChild(tr);
	});
}

window.setInterval(() => {
	getLogs()
}, 2000);

// document.getElementById('output').innerHTML = JSON.stringify(logfiles, null, 2);
</script>
</body>
</html>
`;
