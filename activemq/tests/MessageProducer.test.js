require('dotenv').config();
var stomp = require('stomp-client');
try {
	var stompClient = new stomp(
		process.env.ACTIVEMQ_HOST,
		process.env.ACTIVEMQ_PORT,
		process.env.ACTIVEMQ_USERNAME,
		process.env.ACTIVEMQ_PASSWORD,
		'1.0',
		null, {
			delay: process.env.ACTIVEMQ_DELAY,
			retries: process.env.ACTIVEMQ_RETRIES
		}
	);
	stompClient.connect(function (sessionId) {
		console.log(sessionId);
		var message = "NandhaKumar Viswa";
		var headers = {
			'content-type': 'application/xml',
			'content-length': message.length
		};
		stompClient.publish('/queue/' + process.env.ACTIVEMQ_DESTINATION, message, headers);
		stompClient.disconnect();
	}).
	on("error", (err) => {
		console.log(err.message);
	});
} catch (e) {
	console.log(e.message);
}