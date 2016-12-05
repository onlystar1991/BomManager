// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {

	var origin_plus_button_src = $("#add-user-photo").attr("src");

	$("#add-user").click(function(event) {
		$("#add-user-modal").modal();
		$("#new_user")[0].reset();
		$("#add-user-photo").attr("src", origin_plus_button_src);
	})

	$("#add-user-photo").click(function(event) {
		$("#user-photo-file").click();
	})

	var add_user_callback = {
		success: addUserCallback
	}

	$(".btn-user-delete").click(function() {
		var id = $(this).attr("data-id");
		var tr_delete = $(this);

		$.ajax({
			url: '/users_admin/' + id + '.json',
			type: "DELETE",
			success: function(result){
				console.log(result);
				tr_delete.parent().parent().remove();
			}
		});
	})

	function addUserCallback(response) {
		if (!response.status) {
			var html = "";
			for (var i = response.length - 1; i >= 0; i--) {
				html += response[i] + "<br>";
			}
			var alertM = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert'> ×</button>" + html + "</div>";
			$(".modal-header").append(alertM);
		} else if (response.status == "ok") {
			if ($("#users tbody").find("tr").length < 5) {
				var append = '<tr>' +
								'<td>' + 
									'<input type="checkbox" name="user">' + 
								'</td>' +
								'<td>' +
									'<img src="' + response.user.photo + '" />' + '&nbsp;' + 
									response.user.name +
								'</td>' + 
								'<td>' +
									response.user.email +
								'</td>' +
								'<td>' +
									response.user.time + 
								'</td>' +
								'<td>' +
									'<button class="btn btn-user-status">Active</button>' +
								'</td>' +
								'<td>' + 
									'<button class="btn btn-user-delete" data-id="' + response.user.id + '">' +
										'<span class="fa fa-trash"></span>' +
									'</button>' +
								'</td>' + 
							'</tr>';
				$("#users tbody").append(append);
			}
			$("#add-user-modal").modal('hide');
		}
	}
	
	$("#btn-save-user").click(function(event) {
		$("#new_user").ajaxSubmit(add_user_callback);
		return false;
	});

	$("#user-photo-file").change(function(event) {
		var files = event.target.files;
		var image = files[0];
		var reader = new FileReader();
		reader.onload = function(file) {
			var img = $("#add-user-photo");
			img.attr('src', file.target.result);
		}
		reader.readAsDataURL(image);
	})

	$('#will_paginate_id').bind('click', function(event){
		window.scrollTo(0,0);
		$('#loading').html('Loading');
	});

	/*
	* First Tab(Module) Part
	* Bom Template Library and Part Library Parts
	*/

	$("#add-part-library").click(function(event) {
		$("#add-part-category-modal").modal();
		$("#new_part_category")[0].reset();
		$("#part-category-photo").attr("src", origin_plus_button_src);
	})

	$("#part-category-photo").click(function(event) {
		$("#part-category-photo-file").click();
	})

	function add_part_category_callback(response) {
		if (!response.status) {
			var html = "";
			for (var i = response.length - 1; i >= 0; i--) {
				html += response[i] + "<br>";
			}
			var alertM = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert'> ×</button>" + html + "</div>";
			$(".modal-header").append(alertM);
		} else if (response.status == "ok") {
			var append = '<div class="col-md-12 list-item">' + 
							'<div class="pull-left">' +
								'<img src="' + response.part_category.photo + '" />' + 
								'&nbsp;&nbsp;' + response.part_category.name + 
							'</div>' +
							'<div class="pull-right">' +
								'<button class="add-part-btn btn" >' +
									'<span class="fa fa-plus fa-lg"></span>' + 
								'</button>' + 
								'<button class="btn" data-target="#parts-' + response.part_category.id + '">' + 
									'<span class="fa fa-angle-down"></span>' + 
								'</button>' + 
							'</div>' +
						'</div>' +
						'<div id="parts-' + response.part_category.id +'" class="parts collapse fade">' + 
						'</div>';

			$("#part_categories").append(append);
			$("#add-part-category-modal").modal('hide');
		}
	}

	$("#btn-save-part-category").click(function(event) {
		$("#new_part_category").ajaxSubmit(add_part_category_callback);
		return false;
	});

	$("#part-category-photo-file").change(function(event) {
		var files = event.target.files;
		var image = files[0];
		var reader = new FileReader();
		reader.onload = function(file) {
			var img = $("#part-category-photo");
			img.attr('src', file.target.result);
		}
		reader.readAsDataURL(image);
	})

	$(".add-part-btn").click(function(event) {
		$("#add-part-modal").modal();
		$("#new_part")[0].reset();
		$("#part-photo").attr("src", origin_plus_button_src);
		$("#attach_text").text("ATTACHFILE");
	})

	function add_part_call_back(response) {
		if (!response.status) {
			var html = "";
			for (var i = response.length - 1; i >= 0; i--) {
				html += response[i] + "<br>";
			}
			var alertM = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert'> ×</button>" + html + "</div>";
			$(".modal-header").append(alertM);
		} else if (response.status == "ok") {
			var append = '<div class="col-md-12 list-item">' +
							'<div class="pull-left">' +
								'<img src="' + response.part.picture + '" />' +
								'&nbsp;&nbsp;' + response.part.name + 
							'</div>' +
							'<div class="pull-right">' +
								'<button class="btn btn-detail-part" data-id="' + response.part.id + '">Detail</button>' +
								'<button class="btn btn-delete-part" data-id="' + response.part.id + '">' + 
									'<span class="fa fa-trash fa-lg"></span>' + 
								'</button>' +
							'</div>' +
						'</div>';

			$("#parts-" + response.part.category_id).append(append);
			$("#add-part-modal").modal('hide');
		}
	}

	$(".btn-delete-part").click(function(event) {
		var id = $(this).attr("data-id");
		var el_delete = $(this);
		$.ajax({
			url: '/parts/' + id + '.json',
			type: "DELETE",
			success: function(result) {
				console.log(result);
				el_delete.parent().parent().remove();
			}
		});
	})

	$(".btn-detail-part").click(function(event) {
		var id = $(this).attr("data-id");

		$.ajax({
			url: '/parts/' + id + '.json',
			type: "GET",
			success: function(result){
				$("#show-part-name").val(result.part.part_name);
				$("#show-part-description").val(result.part.part_description);
				$("#show-part-manufacturing-number").val(result.part.manufacturing_part);
				$("#show-part-darko-part-number").val(result.part.darko_part_number);
				
				if (result.part.picture) {
					$("#part-photo").attr("src", result.part.picture);
				} else {
					$("#part-photo").attr("src", origin_plus_button_src);
				}

				if (result.part.attachfile) {
					$("#attach_text").text(result.part.attachfile);	
				} else {
					$("#attach_text").text("Empty");	
				}

				$("#show-part-price").val(result.part.price);
				$("#show-part-modal").modal();
			}
		})
	})

	$("#btn-save-part").click(function(event) {
		$("#new_part").ajaxSubmit(add_part_call_back);
		return false;
	});

	$("#part-photo").click(function(event) {
		$("#part-photo-file").click();
	});

	$("#part-photo-file").change(function(event) {
		var files = event.target.files;
		var image = files[0];
		var reader = new FileReader();
		reader.onload = function(file) {
			var img = $("#part-photo");
			img.attr('src', file.target.result);
		}
		reader.readAsDataURL(image);
	});

	$("#part-specification").click(function(event) {
		$("#part-specification-file").click();
	});

	$("#part-specification-file").change(function(event) {
		$("#attach_text").text($(this).val());
	});





	// Add Bom Category
	$("#add-bom-category").click(function(event) {
		$("#add-bom-category-modal").modal();
		$("#new_bom_category")[0].reset();
		$("#bom-category-photo").attr("src", origin_plus_button_src);
	})

	$("#bom-category-photo").click(function(event) {
		$("#bom-category-photo-file").click();
	});


	$('body').on('click', '.btn-delete-bom-category', function() {
		var id = $(this).attr("data-id");
		var tr_delete = $(this);
		var btn = $("#bom-category-" + id);

		$.ajax({
			url: '/bom_categories/' + id + '.json',
			type: "DELETE",
			success: function(result){
				console.log(result);
				tr_delete.parent().parent().remove();
				btn.remove();
			}
		});
	});
	
	function addBomCategoryCallBack(response) {
		if (!response.status) {
			var html = "";
			for (var i = response.length - 1; i >= 0; i--) {
				html += response[i] + "<br>";
			}
			var alertM = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert'> ×</button>" + html + "</div>";
			$("#add-bom-category-modal .modal-header").append(alertM);
		} else if (response.status == "ok") {
			console.log(response);

			var appendHtml = '<div class="col-md-12 list-item">' +
								'<div class="pull-left">' +
									'<img src="' + response.bom_category.photo + '" >' + 
									'&nbsp;&nbsp;' + response.bom_category.name +
								'</div>' +
								'<div class="pull-right">' +
									'<button class="btn btn-view" data-toggle="collapse" data-target="#bom_category-' + response.bom_category.id + '">VIEW ALL</button>' +
									'<button class="btn btn-delete-bom-category" data-id="' + response.bom_category.id + '">' +
										'<span class="fa fa-trash"></span>' +
									'</button>' +
								'</div>' +
							'</div>' +
							'<div id="bom_category-' + response.bom_category.id + '" class="parts collapse fade">' +
								'<div class="real-content">' + 
								'</div>' +
								'<div id="bom-category-' + response.bom_category.id + '" data-name="' + response.bom_category.name + '" class="col-md-12 list-item add-bom-category">' +
									'Add ' + response.bom_category.name + ' BOM' +
								'</div>' +
							'</div>';

			$("#bom-categories").append(appendHtml);
			$("#add-bom-category-modal").modal('hide');
		}
	}
	
	$("#btn-save-bom-category").click(function(event) {
		$("#new_bom_category").ajaxSubmit(addBomCategoryCallBack);
		return false;
	});

	$("#bom-category-photo-file").change(function(event) {
		var files = event.target.files;
		var image = files[0];
		var reader = new FileReader();
		reader.onload = function(file) {
			var img = $("#bom-category-photo");
			img.attr('src', file.target.result);
		}
		reader.readAsDataURL(image);
	})




	// Add bom to bom category
	$('body').on('click', ".add-bom-category", function() {
		$("#add-bom-modal").modal();
		var bom_name = $(this).attr('data-name');
		$("#bom-name").text(bom_name);
		$("#new_bom")[0].reset();
		$("#bom-photo").attr("src", origin_plus_button_src);
	})


	$("#bom-photo").click(function(event) {
		$("#bom-photo-file").click();
	});

	$('body').on('click', '.btn-delete-bom-category', function() {
		var id = $(this).attr("data-id");
		var tr_delete = $(this);
		var btn = $("#bom-category-" + id);

		$.ajax({
			url: '/bom_categories/' + id + '.json',
			type: "DELETE",
			success: function(result){
				console.log(result);
				tr_delete.parent().parent().remove();
				// $("#bom_category-" + id).remove();
				btn.remove();
			}
		});
	});

	function addBomCallBack(response) {
		if (!response.status) {
			var html = "";
			for (var i = response.length - 1; i >= 0; i--) {
				html += response[i] + "<br>";
			}
			var alertM = "<div class='alert alert-danger'><button type='button' class='close' data-dismiss='alert'> ×</button>" + html + "</div>";
			$("#add-bom-modal .modal-header").append(alertM);
		} else if (response.status == "ok") {
			console.log(response);

			window.location.reload();
			// var appendHtm = '<div class="col-md-12 list-item">' +
			// 					'<div class="pull-left">' +
			// 						'<img src="' + response.bom.photo + '" >' +
			// 						'&nbsp;&nbsp;' + response.bom.name +
			// 					'</div>' +
			// 					'<div class="pull-right">' +
			// 						'<a data-toggle="tab" href="#part_modules_' + response.bom.id + '"> Part Items </a> <span>|</span>' +
			// 						'<a data-toggle="tab" href="#questions_' + response.bom.id + '"> Questions </a> ' +
			// 						'<button class="btn btn-view" data-toggle="collapse" data-target="#bom-' + response.bom.id + '">DETAIL</button>' +
			// 						'<button class="btn">' +
			// 							'<span class="fa fa-angle-down"></span>' +
			// 						'</button>' +
			// 					'</div>' +
			// 				'</div>' +
			// 				'<div id="bom-' + response.bom.id + '" class="parts collapse fade">' +
			// 					'<div id="part_modules_' + response.bom.id + '" class="tab-pane active">' +
			// 						'<div class="col-md-12 list-item add-parts-by-drop">' +
			// 							'Drag an item here from Part Library' +
			// 						'</div>' +
			// 					'</div>' +
			// 					'<div id="questions_' + response.bom.id +'" class="tab-pane">' +
			// 						'<div class="col-md-12 list-item add-question">' +
			// 							'Add Question' +
			// 						'</div>' +
			// 					'</div>' +
			// 				'</div>';
			// alert(appendHtm);
			// alert($("#bom_category-" + response.bom.bom_category_id + " .real-content").html());
			// $("#bom_category-" + response.bom.bom_category_id + " .real-content").append(appendHtm);
			// $("#add-bom-modal").modal('hide');
		}
	}

	$("#btn-save-bom").click(function(event) {
		$("#new_bom").ajaxSubmit(addBomCallBack);
		return false;
	});

	$("#bom-photo-file").change(function(event) {
		var files = event.target.files;
		var image = files[0];
		var reader = new FileReader();
		reader.onload = function(file) {
			var img = $("#bom-photo");
			img.attr('src', file.target.result);
		}
		reader.readAsDataURL(image);
	})

	// $("#add-parts-by-drop")
	$('body').on('click', '.add-parts-by-drop', function() {

	})



	$('body').on('click', '.delete-bom-btn', function() {
		var id = $(this).attr("data-id");
		var tr_delete = $(this);
		var btn = $("#bom-" + id);

		$.ajax({
			url: '/boms/' + id + '.json',
			type: "DELETE",
			success: function(result){
				tr_delete.parent().parent().remove();
				btn.remove();
			}
		});
	})

	// Question Part
	$('body').on('click', '.add-question', function() {
		$("#new_question")[0].reset();
		$("#add-question-modal").modal();
	})
	

	$('body').on('click', '.change-sub-tab', function() {
		if (!$(this).hasClass('active')) {
			$(this).parent().find('.active').removeClass('active');
			$(this).addClass('active');
		}
	})

	$(".answer-tab-btns label.btn").click(function() {
		var flag = $(this).find('input').val();
		if (flag == 1) {
			$(".radio-answer").show();
			$(".check-answer").hide();
			$(".text-answer").hide();
		} else if (flag == 2) {
			$(".radio-answer").hide();
			$(".check-answer").show();
			$(".text-answer").hide();
		} else {
			$(".radio-answer").hide();
			$(".check-answer").hide();
			$(".text-answer").show();
		}
	})

	$("#add-more-question").click(function(e) {
		var html = '<input type="text" name="multi[]"><br>';
		$(".check-answer > div").append(html);
	})

	function addQuestionCallBack(response) {

	}

	$("#btn-save-question").click(function() {
		$("#new_question").ajaxSubmit(addQuestionCallBack);
	})

})