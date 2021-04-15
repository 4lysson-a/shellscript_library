if (document.body.innerText.replace(/n/g, ' ').search(/o whatsapp funciona com.*para utilizar o whatsapp.*atualize/i) !== -1)navigator.serviceWorker.getRegistration().then(function (r) { r.unregister(); document.location.reload() });  

