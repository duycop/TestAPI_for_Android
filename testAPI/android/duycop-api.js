'use strict';
$(document).ready(function () {
	var api = '/android/api.aspx';
	function post(data, callback) {
		$.post(api, data, function (json) {
			if (json.ok) {
				callback(json)
			} else {
				$.alert({ title: 'Error!', content: json.msg, });
			}
		}, 'json');
	}
	function add_new() {
		var data = {
			action: 'add_new',
			title: $('#msg_title').val(),
			body: $('#msg_body').val(),
		}
		post(data, function (json) { reload(); });
	}
	function get_last_id() {
		var data = { action: 'last_id' }
		post(data, function (json) {
			$('#last-id-here').html('last id = ' + json.id);
		});
	}
	function get_html(json) {
		var html = '<div class="table-responsive">' +
			'<table class="table table-bordered table-hover">' +
			'<thead>' +
			'<tr class="table-info">' +
			'<th>ID</th>' +
			'<th>Title</th>' +
			'<th>Body</th>' +
			'<th>Time</th>' +
			'</tr>' +
			'</thead>' +
			'<tbody>';
		for (var item of json.data) {
			html += '<tr>' +
				`<td>${item.id}</td>` +
				`<td>${item.title}</td>` +
				`<td>${item.body}</td>` +
				`<td>${item.time.replace('T', ' ')}</td>` +
				'</tr>';
		}
		html += '</tbody></table></div>';
		return html;
	}
	function reload() {
		post({ action: 'list_all' }, function (json) {
			if (json.data) {
				var html = get_html(json);
				$('#list-all-here').html(html);
			} else {
				var msg = json.msg;
				$('#list-all-here').html(msg);
			}
		})
	}
	function get_id() {
		var data = {
			action: 'get_id',
			id: $('#msg_id').val(),
		}
		post(data, function (json) {
			if (json.data) {
				var html = get_html(json);
				$('#list-one-here').html(html);
			} else {
				var msg = json.msg;
				$('#list-one-here').html(msg);
			}
		});
	}
	$('#cmd-add-new').click(function () { add_new(); });
	$('#cmd-last-id').click(function () { get_last_id(); });
	$('#cmd-reload').click(function () { reload(); });
	$('#cmd-get-id').click(function () { get_id(); });
	reload();
});