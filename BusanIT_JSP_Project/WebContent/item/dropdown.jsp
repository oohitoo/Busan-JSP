<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<style>
.sectiondropdown{
    background-color: #fff9;
    margin-bottom: 0 !important;
    padding: 10px;
    outline: none;
    font-size: 16px;
    color: #333;
    font-weight: 600;
    border: 1px solid #ccc;
    margin-top: 5px;
    border-radius: 4px;
}
#accordion{
    margin-top: 30px;
    margin-bottom: 30px;
}

#accordion i{
    float: right;
    margin-right: 15px;
}

#accordion p{
    padding: 10px;
    margin: 0 !important;
}

#accordion div{
    background-color: #fff;
}
</style>
<script>
	jQuery(function() {
		jQuery("#accordion").accordion({
			header : "h3",
			collapsible : true,
			active : false,
			heightStyle : "content",
			autoHeight : false
		});
	});
	jQuery('.sectiondropdown').click(function() {
		jQuery("i", this).toggleClass("fa-caret-up fa-caret-down");
	});
</script>
<div class="container">
	<div class="row">
		<div id="accordion">
			<h3 class="sectiondropdown">
				Section 1<i class="fa fa-caret-down" aria-hidden="true"></i>
			</h3>
			<div style="height: 30% !important;">
				<p>Mauris mauris ante, blandit et, ultrices a, suscipit eget,
					quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida
					in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros.
					Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum
					a velit eu ante scelerisque vulputate.</p>
			</div>
			<h3 class="sectiondropdown">
				Section 2<i class="fa fa-caret-down" aria-hidden="true"></i>
			</h3>
			<div style="height: 30% !important;">
				<p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum
					sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris
					turpis porttitor velit, faucibus interdum tellus libero ac justo.
					Vivamus non quam. In suscipit faucibus urna.</p>
			</div>
			<h3 class="sectiondropdown">
				Section 3<i class="fa fa-caret-down" aria-hidden="true"></i>
			</h3>
			<div style="height: 30% !important;">
				<p>Nam enim risus, molestie et, porta ac, aliquam ac, risus.
					Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in
					pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac
					felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam
					nisi, eu iaculis leo purus venenatis dui.</p>
			</div>
			<h3 class="sectiondropdown">
				Section 4<i class="fa fa-caret-down" aria-hidden="true"></i>
			</h3>
			<div style="height: 30% !important;">
				<p>Cras dictum. Pellentesque habitant morbi tristique senectus
					et netus et malesuada fames ac turpis egestas. Vestibulum ante
					ipsum primis in faucibus orci luctus et ultrices posuere cubilia
					Curae; Aenean lacinia mauris vel est.</p>
				<p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim
					consequat lectus. Class aptent taciti sociosqu ad litora torquent
					per conubia nostra, per inceptos himenaeos.</p>
			</div>
		</div>
	</div>
</div>

<script src="https://use.fontawesome.com/9bc7fc2951.js"></script>
<script src="https://code.jquery.com/ui/1.12.0-beta.1/jquery-ui.min.js"
	integrity="sha256-WyjlLy3rvVSitHOXMctYkMCOU6GAletPg+qniNKLCQM="
	crossorigin="anonymous"></script>