function openTab(tabName) {
                var i;
                var x = document.getElementsByClassName("tab-content");
                var tabButtons = document.getElementsByClassName("tab-button");
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                    x[i].classList.remove("active");
                }
                for (i = 0; i < tabButtons.length; i++) {
                    tabButtons[i].classList.remove("active");
                }
                document.getElementById(tabName).style.display = "block";
                document.getElementById(tabName).classList.add("active");
                event.currentTarget.classList.add("active");
            }
            document.addEventListener("DOMContentLoaded", function () {
                openTab('search');
            });
            
            