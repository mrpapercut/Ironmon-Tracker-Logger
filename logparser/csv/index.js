const fs = require('fs').promises;
const path = require('path');
const {stringify} = require('csv-stringify');

const logspath = path.resolve(process.cwd(), '../logs/');

const csvdata = []
const columns = {
    seed: 'Seed',
    trainerID: 'Trainer ID',
    battles: 'Battles (total/trainers/wild)',
    ballChosen: 'Ball chosen',
    currentMon: 'Current mon',
    currentName: 'Current name',
    currentNickname: 'Current nickname',
    currentLevel: 'Current level',
    currentBST: 'Current bst',
    currentStatus: 'Current status',
    currentHP: 'HP',
    currentAbilities: 'Current abilities',
    currentMoves: 'Current moves',
    whichMon: 'Which mon',
    healingItems: 'Healing items',
    location: 'Location',
    enemy: 'Enemy',
    enemyMon: 'Enemy mon',
    enemyLevel: 'Enemy level',
    enemyBST: 'Enemy bst',
    enemyStatus: 'Enemy status',
    enemyHP: 'Enemy HP',
    enemyAbilities: 'Enemy abilities',
    enemyMoves: 'Enemy moves',
    lastUsedMove: 'Last move',
    lastUsedMoveDamage: 'Last move damage',
};

const getEnemyChar = lf => {
    const possibleRivalLocations = [
        'Oak\'s Lab',
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

(async () => {
    const files = await fs.readdir(logspath);

    for (let f of files) {
        if (!f.startsWith('seed') && !f.endsWith('.json')) continue;

        const lf = JSON.parse(await fs.readFile(path.join(logspath, f), {encoding: 'utf8'}));

        const csvRow = {};

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

        csvRow.currentMon = curMon;
        csvRow.seed = lf.currentSeed;
        csvRow.trainerID = lf.trainerID;
        csvRow.battles = [lf.totalBattles, lf.totalBattles - lf.totalWildBattles, lf.totalWildBattles].join('/');
        csvRow.ballChosen = lf.ballChosen;

        if (lf.currentMon) {
            csvRow.currentName = lf.currentMon.name;
            csvRow.currentNickname = ''; // lf.currentMon.nickname
            csvRow.currentLevel = lf.currentMon.level;
            csvRow.currentBST = lf.currentMon.bst;
            csvRow.currentStatus = lf.currentMon.statusName;
            csvRow.currentHP = lf.currentMon.curHP + '/' + lf.currentMon.stats.hp;
            csvRow.currentAbilities = lf.currentMon.abilityNames?.filter((a, i) => lf.currentMon.abilityNames.indexOf(a) === i).join(', ') || '';
            csvRow.currentMoves = lf.currentMon?.moves.map(m => m.name).join(', ') || '';
            csvRow.whichMon = curMon;
            csvRow.healingItems = Object.keys(lf.healingItems).map(i => i + ': ' + lf.healingItems[i]).join(', ') || '';
        }

        const lastEncounter = lf.encounters[lf.encounters.length - 1];
        if (lastEncounter) {
            csvRow.location = lastEncounter.location;
            csvRow.lastUsedMove = lastEncounter.lastUsedMove || '';
            csvRow.lastUsedMoveDamage = lastEncounter.lastUsedMoveDamage;

            const enemyMon = lastEncounter.enemyMon;
            if (enemyMon) {
                const enemyChar = getEnemyChar(lf);

                csvRow.enemy = enemyChar;
                csvRow.enemyMon = enemyMon.name || '';
                csvRow.enemyLevel = enemyMon.level || '';
                csvRow.enemyBST = enemyMon.bst || '';
                csvRow.enemyStatus = enemyMon.statusName || '';
                csvRow.enemyHP = enemyMon.curHP || '';
                csvRow.enemyAbilities = enemyMon.abilityNames?.filter((a, i) => enemyMon.abilityNames.indexOf(a) === i).join(', ') || '';
                csvRow.enemyMoves = enemyMon.moves.map(m => m.name).join(', ') || '';
            }
        }

        csvdata.push(csvRow)
    }

    stringify(csvdata, {
        header: true,
        columns
    }, async (err, data) => {
        const d = new Date();
        const p = s => s.toString().padStart(2, '0');
        const ts = [
            d.getUTCFullYear(),
            p(d.getUTCMonth() + 1),
            p(d.getUTCDate()),
            p(d.getHours()),
            p(d.getMinutes()),
            p(d.getSeconds())
        ].join('');
        await fs.writeFile(path.resolve(logspath, `./seedlogs${ts}.csv`), data, {encoding:'utf8'});
    })
})();
