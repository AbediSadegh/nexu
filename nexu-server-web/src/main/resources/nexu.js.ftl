/*
 * © Nowina Solutions, 2015-2015
 *
 * Concédée sous licence EUPL, version 1.1 ou – dès leur approbation par la Commission européenne - versions ultérieures de l’EUPL (la «Licence»).
 * Vous ne pouvez utiliser la présente œuvre que conformément à la Licence.
 * Vous pouvez obtenir une copie de la Licence à l’adresse suivante:
 *
 * http://ec.europa.eu/idabc/eupl5
 *
 * Sauf obligation légale ou contractuelle écrite, le logiciel distribué sous la Licence est distribué «en l’état»,
 * SANS GARANTIES OU CONDITIONS QUELLES QU’ELLES SOIENT, expresses ou implicites.
 * Consultez la Licence pour les autorisations et les restrictions linguistiques spécifiques relevant de la Licence.
 */

var nexuVersion = "1.0";

function nexu_sign(data, success_callback, error_callback) {

	$.ajax({
		  url: "${nexuUrl}/rest/sign",
		  data: {
			  data : data
		  },
		  dataType: "json",
		  success: function (data) {
			  console.log("ok");
			  success_callback.call(this, data);
		  }
		}).fail(function (error) {
			eval(error_callback);
		});
	
}

$.get("${nexuUrl}/nexu-info", function(data) {
	// something responded
	if(data == nexuVersion) {
		// valid version
		$(".nexu-sign-button").html("Sign");
	} else {
		// need update
		$(".nexu-sign-button").html("Update NexU");
		$(".nexu-sign-button").on("click", function() {
			console.log("Update NexU");
			return false;
		});
		
	}
}).fail(function() {
	// no response, NexU not installed or not started
	$(".nexu-sign-button").html("Install NexU");
	$(".nexu-sign-button").on("click", function() {
		console.log("Install NexU");
		window.location = "${baseUrl}/";
		return false;
	});
	
});
