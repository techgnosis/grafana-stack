import http from 'k6/http';

export default function() {

    var chance = Math.floor((Math.random() * 75) + 1);
    var loops = 1
    if (chance == 75) {
        loops = 50
    }
    
    var batch = new Array()

    for (let i = 0; i < loops; i++) {
        batch.push(['GET', 'https://hotrod.lab.home/dispatch?customer=123&nonse=' + Math.random(), null, null ])    
    }

    http.batch(batch)

}