window.addEventListener('message', (event) => {
    if (event.data.action === 'open') {
        document.getElementById('app').classList.remove('hidden');
    }
});

function selectService(service) {
    fetch(`https://${GetParentResourceName()}/requestService`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ service: service })
    });
}

function closeMenu() {
    document.getElementById('app').classList.add('hidden');
    fetch(`https://${GetParentResourceName()}/close`, { method: 'POST' });
}
