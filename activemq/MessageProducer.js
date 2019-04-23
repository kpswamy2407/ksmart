'use strict';
var Stomp = require('stomp-client');
require('dotenv').config();
function MessageProducer() {

}
MessageProducer.prototype.sendMessage = function (url, message) {
	return new Promise((resolve, reject) => {
		try {
			var stompClient = new Stomp(
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
				var headers = {
					'content-type': 'application/xml',
					'url': url,
					'content-length': message.length,
				};
				stompClient.publish('/queue/' + process.env.ACTIVEMQ_DESTINATION, message, headers);
				stompClient.disconnect();
				resolve(200);
			}).
			on("error", (err) => {
				reject(new Error("Unable to reach activemq server"));
			});
		} catch (e) {
			throw new Error("Error while passing message to activemq");
		}
	});
};
module.exports = MessageProducer;