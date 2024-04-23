document.addEventListener('DOMContentLoaded', function () {
    var coursesLink = document.querySelector('#courses');
    var studentsLink = document.querySelector('#std');
    var homeLink = document.querySelector('#homeLink');
    var queryLink = document.querySelector('#queryLink');
    var searchContainer = document.getElementById('searchContainer');
    var queryContainer = document.getElementById('queryContainer');
    var HomeBottons = document.querySelector('.HomeBottons');
    var loginContainer = document.querySelector('.loginContainer');
    var userDetailsContainer = document.getElementById('userDetailsContainer');
    //addstu
    var addStudeBtnCont = document.getElementById('addStudeBtn');

    // Hide the "Add Student" button by default
    addStudeBtnCont.style.display = 'none';

    // Function to hide login container
    function hideLoginContainer() {
        loginContainer.style.display = 'none';
    }
    // Function to show login container
    function showLoginContainer() {
        loginContainer.style.display = 'block';
    }
    
    function hideuserDetailsContainer() {
        userDetailsContainer.style.display = 'none';
    }
    function showuserDetailsContainer() {
        userDetailsContainer.style.display = 'none';
    }



    function hideHomeBottons() {
        HomeBottons.style.display = 'none';
    }

    function showHomeBottons() {
        HomeBottons.style.display = 'block';
    }

    

    
    


    // Event listeners for links
    coursesLink.addEventListener('click', function (event) {
        event.preventDefault();
        showSearchContainer();
        filterBtn.style.display = 'none';
        enrolledStudents.style.display = 'none';
        hideLoginContainer();
        hideHomeBottons();
        
    });

    studentsLink.addEventListener('click', function (event) {
        event.preventDefault();
        showSearchContainer();
        //addstu
        showaddStudeBtnCont();
        addCourseBtn.style.display = 'none';
        hideLoginContainer();
        hideHomeBottons();
        
    });

    homeLink.addEventListener('click', function (event) {
        event.preventDefault();
        hideContainers();
        showLoginContainer();
        showHomeBottons();
        
    });

    queryLink.addEventListener('click', function (event) {
        event.preventDefault();
        showQueryContainer();
        hideLoginContainer();
        hideHomeBottons();
       
    });

    // Function to show search container
    function showSearchContainer() {
        searchContainer.style.display = 'block';
        queryContainer.style.display = 'none';
    }

    //addstu
    function showaddStudeBtnCont() {
        if (addStudeBtnCont) {
            addStudeBtnCont.style.display = 'block';
        }
    }

    // Function to show query container
    function showQueryContainer() {
        searchContainer.style.display = 'none';
        queryContainer.style.display = 'block';
        addStudeBtnCont.style.display = 'none';
    }

    // Function to hide all containers
    function hideContainers() {
        searchContainer.style.display = 'none';
        queryContainer.style.display = 'none';
        //addstu
        addStudeBtnCont.style.display = 'none';
        addstudentForm.style.display = 'none';
        addCourseForm.style.display = 'none';
        filterForm.style.display = 'none';

    }
    
});

function toggleAcademicDropdown() {
    var academicDropdownContent = document.getElementById("academicDropdownContent");
    if (academicDropdownContent.style.display === "block") {
        academicDropdownContent.style.display = "none";
    } else {
        academicDropdownContent.style.display = "block";
    }
}

// Event listener for home link
document.getElementById("homeLink").addEventListener("click", function () {
    // Show the academic details dropdown
    document.getElementById("academicDetailsDropdown").style.display = "block";
    document.getElementById("courseList").style.display = "none";
});

function toggleDropdown() {
    var dropdownContent = document.getElementById("dropdownContent");
    if (dropdownContent.style.display === "block") {
        dropdownContent.style.display = "none";
    } else {
        dropdownContent.style.display = "block";
    }
}

// Event listener for home link
document.getElementById("homeLink").addEventListener("click", function () {
    // Show the personal details dropdown
    document.getElementById("personalDetailsDropdown").style.display = "block";
    document.getElementById('enrolledStudents').style.display = "none";
});



