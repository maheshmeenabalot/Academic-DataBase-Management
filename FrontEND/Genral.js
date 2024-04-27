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
    var aboutUs = document.querySelector('#aboutUs');
    var viewCourse = document.querySelector('#instructor-Courses'); 
    var enrolledStudents = document.querySelector('#enrolledStudents');
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
        instructorList.style.display = 'none';
        document.getElementById('instructorCourseList').style.display = 'none';
        hideLoginContainer();
        hideHomeBottons();
        
    });

    studentsLink.addEventListener('click', function (event) {
        event.preventDefault();
        showSearchContainer();
        //addstu
        // showaddStudeBtnCont();
        document.getElementById('studentData').style.display='block';
        document.getElementById('instructorCourseList').style.display = 'none'
        addCourseBtn.style.display = 'none';
        instructorList.style.display = 'none';
        document.getElementById('enrolledStudents').style.display='none';
        hideLoginContainer();
        hideHomeBottons();
        
    });

    homeLink.addEventListener('click', function (event) {
        event.preventDefault();
        hideContainers();
        showLoginContainer();
        showHomeBottons();
        document.getElementById('instructorCourseList').style.display = 'none'
        document.getElementById('enrolledStudents').style.display='none';
        
    });

    InstList.addEventListener('click', function (event) {
        event.preventDefault();
        showSearchContainer();
        addCourseBtn.style.display = 'none';
        instructorList.style.display = 'block';
        hideLoginContainer();
        hideHomeBottons();
        document.getElementById('instructorCourseList').style.display = 'none'
        // addStudeBtn.style.display = 'none';
        // addCourseBtn.style.display = 'none';
        // FilterBtn.style.display = 'none';
        // addInstructorBtn.style.display = 'block';
        // // searchInput.value = '';

    });

    queryLink.addEventListener('click', function (event) {
        event.preventDefault();
        showQueryContainer();
        hideLoginContainer();
        hideHomeBottons();
        instructorList.style.display = 'none';
        document.getElementById('instructorCourseList').style.display = 'none'
        document.getElementById('enrolledStudents').style.display='none';
       
    });

    aboutUs.addEventListener('click', function (event) {
        event.preventDefault();
        hideLoginContainer();
        hideContainers() ;
        document.getElementById('instructorList').style.display='none';
        document.getElementById('enrolledStudents').style.display='none';
        document.getElementById('studentData').style.display='none';
        document.getElementById('personalDetailsDropdown').style.display='none';
        document.getElementById('academicDetailsDropdown').style.display='none';  
        document.getElementById('instructorCourseList').style.display = 'none' 
        
       
    });
    viewCourse.addEventListener('click', function (event) {
        event.preventDefault();
        hideLoginContainer();
        hideContainers() ;
        document.getElementById('instructorList').style.display='none';
        document.getElementById('enrolledStudents').style.display='none';
        document.getElementById('studentData').style.display='none';
        document.getElementById('personalDetailsDropdown').style.display='none';
        document.getElementById('academicDetailsDropdown').style.display='none';   
        document.getElementById('instructorCourseList').style.display = 'block' 
       
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
        
        
        // document.getElementById('studentData').style.display='none';
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
    document.getElementById('instructorList').style.display = "none";
});



