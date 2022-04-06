import http from 'k6/http';

export const options = {
    insecureSkipTLSVerify: true,
    stages: [
        { duration: '1s', target: 1},
        { duration: '30m', target: 1},
        { duration: '1s', target: 10},
        { duration: '30m', target: 10}
    ]
}

export default function () {
    http.get('https://hotrod.lab.home/dispatch?customer=123&nonse=' + Math.random())
}