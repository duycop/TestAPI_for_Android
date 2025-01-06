'use strict';
$(document).ready(function () {
	var api = '/android/api.aspx';
	function post(data, callback) {
		$('#log-here').append('<b>TX:</b> ' + JSON.stringify(data) +'<br>');
		$.post(api, data, function (json) {
			$('#log-here').append('<b>RX:</b>' + JSON.stringify(json) +'<br>');
			if (json.ok) {
				callback(json)
			} else {
				$.alert({ title: 'Error!', content: json.msg });
			}
		}, 'json');
	}
	function add_new_msg() {
		var data = {
			action: 'add_new',
			title: $('#msg-title').val(),
			body: $('#msg-body').val(),
		}
		post(data, function (json) { reload(); });
	}
	function get_last_id() {
		var data = { action: 'last_id' }
		post(data, function (json) {
			$('#last-id-here').html('last id = ' + json.id);
		});
	}
	function json_to_html(json) {
		var html = '<div class="table-responsive">' +
			'<table class="table table-bordered table-hover">' +
			'<thead>' +
			'<tr class="table-info">' +
			'<th width="5%" class="text-center">ID</th>' +
			'<th width="25%">Title</th>' +
			'<th>Body</th>' +
			'<th width="25%" class="text-center">Time</th>' +
			'</tr>' +
			'</thead>' +
			'<tbody>';
		for (var item of json.data) {
			html += '<tr>' +
				`<td class="text-center">${item.id}</td>` +
				`<td>${item.title}</td>` +
				`<td>${item.body}</td>` +
				`<td class="text-center">${item.time.replace('T', ' ')}</td>` +
				'</tr>';
		}
		html += '</tbody></table></div>';
		return html;
	}
	function get_all_msg() {
		post({ action: 'list_all' }, function (json) {
			if (json.data) {
				var html = json_to_html(json);
				$('#list-all-here').html(html);
			} else {
				$('#list-all-here').html(json.msg);
			}
		})
	}
	function get_one_msg_by_id() {
		var data = {
			action: 'get_id',
			id: parseInt($('#msg-id').val()),
		}
		post(data, function (json) {
			if (json.data) {
				var html = json_to_html(json);
				$('#list-one-here').html(html);
			} else {
				$('#list-one-here').html(json.msg);
			}
		});
	}
	function get_new_id() {
		var data = {
			action: 'new_id',
			id: parseInt($('#msg-last-id').val()),
		}
		post(data, function (json) {
			$('#new-id-here').html('new id=' + json.id);
		});
	}
	$('#cmd-add-new-msg').click(function () { add_new_msg(); });
	$('#cmd-get-last-id').click(function () { get_last_id(); });
	$('#cmd-get-new-id').click(function () { get_new_id(); });
	$('#cmd-get-one-msg-by-id').click(function () { get_one_msg_by_id(); });
	$('#cmd-get-all-msg').click(function () { get_all_msg(); });
	$('#cmd-clear-log').click(function () { $('#log-here').html(''); });
	get_last_id();
	setTimeout(get_all_msg, 400);
});