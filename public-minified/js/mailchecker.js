require(["order!jquery","order!jquery.mailcheck"],function(){var a=["yahoo.com","google.com","hotmail.com","gmail.com","me.com","aol.com","mac.com","live.com","comcast.net","googlemail.com","msn.com","hotmail.co.uk","yahoo.co.uk","facebook.com","verizon.net","sbcglobal.net","att.net","gmx.com","mail.com","mysociety.org"];$(document).on("change","input[type=email]",function(){var b=$(this),c=b.next(".suggestion");c||(c=$('<div class="suggestion" />'),b.after(c).hide()),b.mailcheck({domains:a,suggested:function(a,b){var d="Did you mean <strong>"+b.full+"</strong>?";c.html(d).slideDown()},empty:function(a){c.slideUp()}})})})