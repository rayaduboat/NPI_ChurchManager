<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modalReview {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modalReview-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modalReview-header {
    padding: 2px 16px;
    background-color:  #293955;
    color: white;
}

.modalReview-body {padding: 2px 16px;}

.modalReview-footer {
    padding: 2px 16px;
    background-color: #293955;
    color: white;
}
</style>

<body>

<h2>Animated Modal with Header and Footer</h2>

<!-- Trigger/Open The Modal -->
<button id="buttonOpenReviewModal">Open Modal</button>

<!-- The Modal -->
<div id="reviewModal" class="modalReview">

  <!-- Modal content -->
  <div class="modalReview-content">
    <div class="modalReview-header">
      <span class="close">&times;</span>
      <h2>Member assigned roles</h2>
    </div>
    <div class="modalReview-body">
      <p>Some text in the Modal Body</p>
      <p>Some other text...</p>
    </div>
    <div class="modalReview-footer">
      <h3>Rabant Solutions Reports</h3>
    </div>
  </div>

</div>

<script>
    // Get the modalReview
    var modalReview = document.getElementById('reviewModal');

    // Get the button that opens the modalReview
    var btn = document.getElementById("buttonOpenReviewModal");

    // Get the <span> element that closes the modalReview
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modalReview 
    btn.onclick = function () {
        modalReview.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modalReview
    span.onclick = function () {
        modalReview.style.display = "none";
    }

    // When the user clicks anywhere outside of the modalReview, close it
    window.onclick = function (event) {
        if (event.target == modalReview) {
            modalReview.style.display = "none";
        }
    }
</script>

</body>
</html>
