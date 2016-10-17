(function() {

	'use strict';

	const POST_MESSAGE_URL = '/messages?message[text]=';
	const _ = (sel) => document.querySelector(sel);
	const saveMessageBtn = _('.save-message');
	const saveMessageBtnDisabled = _('.save-message.disabled');
	const inputTextField = _('.input-text');
	const outputBlock = _('.output-block');
	const messageUrl = _('.message-url');
	const charCountNode = _('.char-counter .entered');

	const makeRequest = (method, url) => (
		new Promise((resolve, reject) => {
			const req = new XMLHttpRequest();
			req.open(method, url, true);
			req.addEventListener('load', () => {
				const res = JSON.parse(req.response);
				req.status >= 200 && req.status < 400 ? resolve(res) : reject(res);
			});
			req.send();
		})
	);

	const sendMessage = (message) => makeRequest('post', POST_MESSAGE_URL + encodeURIComponent(message));

	const isValidInput = (text) => {
		const trimmed = text.trim();
		return trimmed.length && trimmed.length <= 140;
	};

	inputTextField.addEventListener('input', (e) => {
		const text = e.target.value;
		const charQty = text.trim().length;
		charCountNode.textContent = charQty;
		if(isValidInput(text)) {
			saveMessageBtn.style.display = 'block';
			saveMessageBtnDisabled.style.display = 'none';
			charCountNode.style.color = 'inherit';

		} else {
			saveMessageBtn.style.display = 'none';
			saveMessageBtnDisabled.style.display = 'block';
			charCountNode.style.color = 'red'
		}
	});

	saveMessageBtn.addEventListener('click', (e) => {
		e.preventDefault()
		sendMessage(inputTextField.value)
			.then(res => {
				const url = location.origin + '/messages/' + res.link;
				messageUrl.href = url;
				outputBlock.style.display = 'block';
			})
			.catch(e => console.error(e));
	});

})();
