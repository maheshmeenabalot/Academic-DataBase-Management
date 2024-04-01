document.addEventListener('DOMContentLoaded', function () {
    // Selecting links and containers
    var studentsLink = document.querySelector('#std');
    var coursesLink = document.querySelector('#courses');
    var queryLink = document.querySelector('#queryLink');
    var homeLink = document.querySelector('#homeLink');
    var studentDataContainer = document.getElementById('studentData');
    var addStudeBtn = document.getElementById('addStudeBtn');
    var studentForm = document.getElementById('addstudentForm');
    var enrolledStudentsContainer = document.getElementById('enrolledStudents');
    var FilterBtn = document.getElementById('filterBtn');
    var FilterForm = document.getElementById('filterForm');
    const searchInput = document.getElementById('searchbar');
    var curr_sec = 0;

    var addCourseBtn = document.getElementById('addCourseBtn');

    homeLink.addEventListener('click', function (event) {
        event.preventDefault();
        hideContainers();
    });
    // Event listeners for links
    studentsLink.addEventListener('click', function (event) {
        event.preventDefault();
        curr_sec = 1;  // denote that we are in student section
        hideContainers();
        fetchStudentData();
        searchInput.value = '';
        FilterForm.style.display = 'none';
        studentForm.style.display = 'none';
        FilterBtn.style.display = 'block';
        enrolledStudentsContainer.style.display = 'none';

    });

    coursesLink.addEventListener('click', function (event) {
        event.preventDefault();
        addCourseBtn.style.display = 'block';
        curr_sec = 2;   // denote that we are in student section
        hideContainers();
        fetchCourseData();
        addStudeBtn.style.display = 'none';
        
        searchInput.value = '';

    });

    queryLink.addEventListener('click', function (event) {
        event.preventDefault();
        hideContainers();
        addStudeBtn.style.display = 'none';
        searchInput.value = '';

    });

    // Event listener for the "Add Student" button
    addStudeBtn.addEventListener('click', function (event) {
        event.preventDefault();
        studentForm.style.display = 'block'; // Show the student form
        addStudeBtn.style.display = 'none';
        hideContainers();
        searchContainer.style.display = 'none';
        addStudentForm.reset();
        FilterForm.style.display = 'none';
    });
    addCourseBtn.addEventListener('click', function (event) {
        event.preventDefault();
        addCourseForm.style.display = 'block'; // Show the student form
        addCourseBtn.style.display = 'none';
        hideContainers();
        searchContainer.style.display = 'none';
        addCourseForm.reset();
        FilterForm.style.display = 'none';
    });
    // Event listener for the "filter tbn" button
    FilterBtn.addEventListener('click', function (event) {
        event.preventDefault();
        hideContainers();
        searchContainer.style.display = 'none';
        addStudeBtn.style.display = 'none';
        studentForm.style.display = 'none';
        FilterForm.style.display = 'block';
    });


    // Event listener for search button
    document.getElementById('searchbtn').addEventListener('click', function () {
        var searchText = document.querySelector('input[name="search"]').value;
        var url = 'http://localhost:5000/search?query=' + encodeURIComponent(searchText);
        fetch(url)
            .then(response => response.json())
            .then(data => {
                displaySearchResults(data);//student,course
            })
            .catch(error => console.error('Error:', error));
    });



    // Function to fetch and display student data
    function fetchStudentData() {
        fetch('http://localhost:5000/student')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                var tableHtml = generateStudentTable(data);
                studentDataContainer.innerHTML = tableHtml;
                paginate(1);
            })
            .catch(error => {
                console.error('Error fetching student data:', error);
            });
    }

    // Function to fetch and display course data
    function fetchCourseData() {
        fetch('http://localhost:5000/courses')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                var tableHtml = generateCourseTable(data);
                studentDataContainer.innerHTML = tableHtml;
            })
            .catch(error => {
                console.error('Error fetching courses data:', error);
            });
    }
    //** */
    // Function to display search results
    function displaySearchResults(data) {
        studentDataContainer.innerHTML = ''; // Clear previous search results

        if (data.students.length === 0 && data.courses.length === 0) {
            studentDataContainer.innerHTML = 'No matching records found.';
        } else {
            if (data.students.length > 0) {
                studentDataContainer.innerHTML += generateStudentTable(data.students);
            }

            if (data.courses.length > 0) {
                studentDataContainer.innerHTML += generateCourseTable(data.courses);
            }
        }
    }

    const form = document.getElementById('addstudentForm');
    // Add an event listener for the form's submit event
    form.addEventListener('submit', function (event) {
        // Prevent the form from submitting normally
        event.preventDefault();

        // Get the form data
        const formData = new FormData(form);
        const studentID = formData.get('studentID');
        const studentName = formData.get('studentName');
        const branch = formData.get('branch');
        const batch = formData.get('batch');
        const gender = formData.get('gender');
        const email = formData.get('email');
        const cgpa = formData.get('cgpa');

        addStudentToDatabase(studentID, studentName, branch, batch, gender, email, cgpa);
        // Log the variables to the console
        console.log('Name:', studentName);
        console.log('Email:', email);
        console.log('Student ID:', studentID);
        console.log('Branch:', branch);
        console.log('Batch:', batch);
        console.log('Gender:', gender);
        console.log('CGPA:', cgpa);

        addStudentForm.style.display = 'none';
        // Show the "Add" button
        addButton.style.display = 'block';


    });

    // Function to send student data to backend for addition to database
    function addStudentToDatabase(studentID, studentName, branch, batch, gender, email, cgpa) {
        console.log('Name:');
        console.log('Email:', email);
        var url = 'http://localhost:5000/submit-form';
        var data = {
            studentID: studentID,
            studentName: studentName,
            branch: branch,
            batch: batch,
            gender: gender,
            email: email,
            cgpa: cgpa
        };

        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Failed to add student');
                }
                return response.json();
            })
            .then(data => {
                console.log('Student added successfully:', data);
                const result = window.confirm('Student added successfully. Do you want to add another student?');
                if (result) {
                    // User clicked "OK"
                    // Add another student (perform the necessary actions)
                    console.log('Add another student');
                    document.getElementById("addstudentForm").reset();
                } else {
                    // User clicked "Cancel"
                    console.log('Operation cancelled');
                    studentForm.style.display = 'none';
                    addStudeBtn.style.display = 'block';
                }
                fetchStudentData(); // Refresh student table
                showSearchContainer()
            })
            .catch(error => {
                console.error('Error adding student:', error);
                // alert('Failed to add student');
                const result0 = window.confirm('Failed to add student. Do you want to retry?');
                if (result0) {
                    // User clicked "OK"
                    // Add another student (perform the necessary actions)
                    console.log('Add another student');
                    document.getElementById("addstudentForm").reset();
                    showSearchContainer();
                    //addstu
                    showaddStudeBtnCont();
                } else {
                    // User clicked "Cancel"
                    console.log('Operation cancelled');
                    studentForm.style.display = 'none';
                    // addStudeBtn.style.display = 'block';
                    fetchStudentData();
                    // addStudeBtn.style.display = 'block';
                    showSearchContainer();
                    //addstu
                    showaddStudeBtnCont(    );

                }
            });
    }
    // /****// add course *****/
    const addCourseForm = document.getElementById('addCourseForm');

    addCourseForm.addEventListener('submit', function (event) {
        event.preventDefault();
    
        const formData = new FormData(addCourseForm);
        const courseCode = formData.get('courseCode');
        const school = formData.get('school');
        const instructorName = formData.get('instructorName');
        const email = formData.get('courseEmail');
    
        addCourseToDatabase(courseCode, school, instructorName, email);
    
        addCourseForm.style.display = 'none';
    });
    
    function addCourseToDatabase(courseCode, school, instructorName, email) {
        const url = 'http://localhost:5000/submit-course';
        const data = {
            courseCode: courseCode,
            school: school,
            instructorName: instructorName,
            email: email
        };
    
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Failed to add course');
            }
            return response.json();
        })
        .then(data => {
            console.log('Course added successfully:', data);
            const result1 = window.confirm('Course added successfully. Do you want to add another Course?');
            // Add logic for handling successful course addition
            if (result1) {
                // User clicked "OK"
                // Add another student (perform the necessary actions)
                console.log('Add another Course');
                document.getElementById("addCourseForm").reset();
            } else {
                // User clicked "Cancel"
                console.log('Operation cancelled');
                addCourseForm.style.display = 'none';
                addCourseBtn.style.display = 'block';
            }
            fetchCourseData(); // Refresh student table
            // showSearchContainer();
        })
        .catch(error => {
            console.error('Error adding course:', error);

                const result2 = window.confirm('Failed to add Course. Do you want to retry?');
                if (result2) {
                    // User clicked "OK"
                    // Add another student (perform the necessary actions)
                    console.log('Add another Course');
                    document.getElementById("addCourseForm").reset();
                     showSearchContainer();
                    //addstu
                    // addCourseBtn.style.display='block';
                } else {
                    // User clicked "Cancel"
                    console.log('Operation cancelled');
                    studentForm.style.display = 'none';
                    // addStudeBtn.style.display = 'block';
                    fetchCourseData();
                    addCourseBtn.style.display='block';
                    // addStudeBtn.style.display = 'block';
                    showSearchContainer();
                    // //addstu
                    // showaddStudeBtnCont();

                }
        });
    }
    

    //********Filter***** */
    const fform = document.getElementById('filterForm');
    // Add an event listener for the form's submit event
    fform.addEventListener('submit', function (event) {
        // Prevent the form from submitting normally
        event.preventDefault();

        const fformData = new FormData(fform);

        const branch = fformData.get('branch');
        const batch = fformData.get('batch');
        const gender = fformData.get('gender');
        const cgpaMin = fformData.get('cgpaMin');
        const cgpaMax = fformData.get('cgpaMax');
        console.log('Branch:', branch);
        console.log('Batch:', batch);
        console.log('Gender:', gender);
        console.log('CGPA Min:', cgpaMin);
        console.log('CGPA Max:', cgpaMax);

        const queryParams = new URLSearchParams({
            branch: branch,
            batch: batch,
            gender: gender,
            cgpaMin: cgpaMin,
            cgpaMax: cgpaMax
        }).toString();

        // Construct the URL with filter parameters
        const url = 'http://localhost:5000/filter?' + queryParams;
        console.log(url);

        // Send GET request with filter parameters to the server
        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log(data);
                displayFilteredResults(data);
            })
            .catch(error => {
                console.error('Error:', error);
                // Handle error
            });

        filterForm.style.display = 'none';
        searchContainer.style.display = 'block';

    });
    // Function to display filtered results
    function displayFilteredResults(data) {
        studentDataContainer.innerHTML = ''; // Clear previous search results

        if (!data || data.length === 0) {
            studentDataContainer.innerHTML = 'No matching records found.';
        } else {
            var tableHtml = generateStudentTable(data);
            studentDataContainer.innerHTML = tableHtml;
        }
    }

    document.getElementById('querySearchbar').addEventListener('click', function () {
        var sqlQuery = document.querySelector('input[name="querySearch"]').value;
        var url = 'http://localhost:5000/search1?sql=' + encodeURIComponent(sqlQuery);

        fetch(url)
            .then(response => response.json())
            .then(data => {
                displaySearchResults(data);
            })
            .catch(error => console.error('Error:', error));

        function displaySearchResults(data) {
            var studentDataContainer = document.getElementById('studentData');
            studentDataContainer.innerHTML = ''; // Clear previous search results

            if (data.length === 0) {
                studentDataContainer.innerHTML = 'No matching records found.';
            } else {
                var tableHtml = generateStudentTable(data);
                studentDataContainer.innerHTML = tableHtml;
                paginate(1);
            }
        }
    });



    // Function to generate student table HTML
    // Modify the generateStudentTable function to include pagination based on total entries
    function generateStudentTable(data) {
        var tableHtml = '<table border="1" id="studentTable">';
        tableHtml += '<thead><tr><th>Student ID</th><th>Student Name</th><th>Branch</th><th>Batch</th><th>Gender</th><th>Email</th><th>CGPA</th></tr></thead>';
        tableHtml += '<tbody>';

        // Display 10 students per page
        for (var i = 0; i < data.length; i++) {
            var student = data[i];
            tableHtml += '<tr>';
            tableHtml += '<td>' + student.Student_ID + '</td>';
            tableHtml += '<td>' + student.Student_Name + '</td>';
            tableHtml += '<td>' + student.Branch + '</td>';
            tableHtml += '<td>' + student.Batch + '</td>';
            tableHtml += '<td>' + student.Gender + '</td>';
            tableHtml += '<td>' + student.Email + '</td>';
            tableHtml += '<td>' + student.CGPA + '</td>';
            tableHtml += '</tr>';
        }

        tableHtml += '</tbody>';
        tableHtml += '</table>';
        tableHtml += '<br>';

        // Calculate total number of pages
        var totalPages = Math.ceil(data.length / 10);

        // Add pagination buttons
        tableHtml += '<div id="pagination">';
        for (var page = 1; page <= totalPages; page++) {
            tableHtml += '<button class="pagination-btn" data-page="' + page + '">' + page + '</button>';
        }
        tableHtml += '</div>';
        tableHtml += '<style>.pagination-btn { margin-right: 5px; }  </style>';


        return tableHtml;
    }

    // Event listener for pagination buttons
    document.addEventListener('click', function (event) {
        if (event.target.classList.contains('pagination-btn')) {
            var page = parseInt(event.target.getAttribute('data-page'));
            paginate(page);
        }
    });

    // Function to paginate the student data table
    function paginate(page) {
        var startIndex = (page - 1) * 10;
        var endIndex = page * 10;
        var tableRows = document.querySelectorAll('#studentTable tbody tr');

        // Hide all rows
        tableRows.forEach(function (row) {
            row.style.display = 'none';
        });

        // Display rows for the current page
        for (var i = startIndex; i < endIndex && i < tableRows.length; i++) {
            tableRows[i].style.display = '';
        }
    }

    // Function to generate course table HTML
    function generateCourseTable(data) {
        var tableHtml = '<table border="1">';
        tableHtml += '<tr><th>Course Code</th><th>School</th><th>Instructor Name</th><th>Email</th><th>View Students</th></tr>';
        data.forEach(function (course, index) {
            var courseId = 'course_' + index;
            tableHtml += '<tr id="' + courseId + '">';
            tableHtml += '<td>' + course.Course_Code + '</td>';
            tableHtml += '<td>' + course.School + '</td>';
            tableHtml += '<td>' + course.Instructor_Name + '</td>';
            tableHtml += '<td>' + course.Email + '</td>';
            tableHtml += '<td><button class="viewBtn">View</button></td>';
            tableHtml += '</tr>';
        });
        tableHtml += '</table>';
        tableHtml += '<style>.viewBtn { width:108px; }  </style>';
        return tableHtml;
    }

    studentDataContainer.addEventListener('click', function (event) {
        if (event.target.classList.contains('viewBtn')) {
            var courseRow = event.target.closest('tr');
            var courseCode = courseRow.cells[0].textContent;

            enrolledStudents.style.display = 'block';
            fetchEnrolledStudents(courseCode);
        }
    });

    function fetchEnrolledStudents(courseCode) {
        fetch('http://localhost:5000/enrolled-students?course=' + encodeURIComponent(courseCode))
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                displayEnrolledStudents(data, courseCode);
            })
            .catch(error => {
                console.error('Error fetching enrolled students:', error);
            });
    }

    function displayEnrolledStudents(data, courseCode) {
        var studentTableHtml = '<h2>Enrolled Students for ' + courseCode + '</h2>';
        studentTableHtml += '<table>';
        studentTableHtml += '<tr><th>Student Name</th><th>Student ID</th><th>Branch</th><th>Batch</th><th>Email</th></tr>';
        data.forEach(function (student) {
            studentTableHtml += '<tr>';
            studentTableHtml += '<td>' + student.Student_Name + '</td>';
            studentTableHtml += '<td>' + student.Student_ID + '</td>';
            studentTableHtml += '<td>' + student.Branch + '</td>';
            studentTableHtml += '<td>' + student.Batch + '</td>';
            studentTableHtml += '<td>' + student.Email + '</td>';
            studentTableHtml += '</tr>';
        });
        studentTableHtml += '</table>';
        document.getElementById('enrolledStudents').innerHTML = studentTableHtml;
    }

    function hideEnrolledStudents() {
        document.getElementById('enrolledStudents').innerHTML = '';
    }

    // Function to hide containers
    // function hideContainers() {
    //     document.getElementById('studentDataContainer').innerHTML = ''; // Clear student data container
    //     hideEnrolledStudents();
    // }
    function hideContainers() {
        studentDataContainer.innerHTML = ''; // Clear student data container
        hideEnrolledStudents();
    }



    // Function to hide containers
    function hideContainers() {
        studentDataContainer.innerHTML = ''; // Clear student data container
    }
});


function openLoginForm() {
    // Show login form
    const loginForm = document.getElementById('loginForm');
    loginForm.style.display = 'block';

    // Clear previous input values
    document.getElementById('username').value = '';
    document.getElementById('password').value = '';

    // Hide the logged-in user info
    document.getElementById('userProfile').style.display = 'none';
}



document.addEventListener('DOMContentLoaded', function () {
    const loginForm = document.getElementById('loginForm');
    const loginContainer = document.querySelector('.loginContainer');
    const loggedInUser = document.getElementById('loggedInUser');
    const navbar = document.getElementById('navbar');
    const loginButton = document.getElementById('loginButton');

    // Check if the user is already logged in
    const isLoggedIn = sessionStorage.getItem('isLoggedIn') === 'true';

    if (isLoggedIn) {
        // Remove existing user information
        while (loggedInUser.firstChild) {
            loggedInUser.removeChild(loggedInUser.firstChild);
        }

        // Display the username in the navbar
        const username = sessionStorage.getItem('username');
        const userAvatar = document.createElement('i');
        userAvatar.classList.add('fa-regular', 'fa-user');
        loggedInUser.appendChild(userAvatar);
        loggedInUser.appendChild(document.createTextNode(username));
        navbar.insertBefore(loggedInUser, navbar.childNodes[0]); // Insert the "Logged in as" element at the beginning of the navbar
    } else {
        // Show the login button if the user is not logged in
        loginButton.style.display = 'block';
    }

    loginButton.addEventListener('click', function () {
        // Toggle the display of the login form when the button is clicked
        loginContainer.style.display = loginContainer.style.display === 'none' ? 'block' : 'none';
    });
    
    function hideProtectedContent() {
        document.querySelectorAll('.protected-content').forEach(element => {
            element.style.display = 'none';
        });
    }
    
    // Function to show sections with the 'protected-content' class
    function showProtectedContent() {
        document.querySelectorAll('.protected-content').forEach(element => {
            element.style.display = 'block';
        });
    }
    
    // Add event listener to the logout button
    logoutButton.addEventListener('click', function () {
        // Call the function to hide protected content when the user logs out
        hideProtectedContent();
        // Additional logout functionality here...
    });

    loginForm.addEventListener('submit', function (event) {
        event.preventDefault();

        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;

        const credentials = {
            username: username,
            password: password
        };

        fetch('http://localhost:5000/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(credentials)
        })
        .then(response => {
            // After successful login
if (response.ok) {
    console.log('Login successful');
    sessionStorage.setItem('isLoggedIn', 'true');
    sessionStorage.setItem('username', username);
    loginContainer.style.display = 'none';

    showProtectedContent();
    fetchUserDetails(username);
    fetchProfileData(username);
    // Query student table to get student's name
    
    fetch(`http://localhost:5000/student/${username}`, {
        method: 'GET',
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => response.json())
    .then(data => {
        const studentName = data.Student_Name;
        

        // Remove existing user information
        while (loggedInUser.firstChild) {
            loggedInUser.removeChild(loggedInUser.firstChild);
        }

        

        // Display the username in the navbar
        const userAvatar = document.createElement('i');
        userAvatar.classList.add('fa-regular', 'fa-user');
        loggedInUser.appendChild(userAvatar);
        loggedInUser.appendChild(document.createTextNode('  '+studentName));
        navbar.insertBefore(loggedInUser, navbar.childNodes[0]); // Insert the "Logged in as" element at the beginning of the navbar

        // Hide the login button after successful login
        
        loginButton.style.display = 'none';
       
        
    })
    .catch(error => {
        console.error('Error fetching student data:', error);
    });
} else {
    console.error('Login failed');
}

        });
    });
});


document.addEventListener('DOMContentLoaded', function () {
    const loginForm = document.getElementById('loginForm');
    const loginContainer = document.querySelector('.loginContainer');
    const loggedInUser = document.getElementById('loggedInUser');
    const loginButton = document.getElementById('loginButton'); // assuming the id of the login button is 'loginButton'

    // Function to check login status
    function checkLoginStatus() {
        // Check if the user is logged in
        const isLoggedIn = sessionStorage.getItem('isLoggedIn') === 'true';
    
        if (isLoggedIn) {
            // Hide the login form and login button
            loginForm.style.display = 'none';
            loginContainer.style.display = 'none';
            loginContainer.style.boxShadow = 'none'; // Remove shadow
            loginButton.style.display = 'none';
            // Show the logged-in user info
            loggedInUser.style.display = 'block';
        } else {
            // Show the login form and login button
            loginForm.style.display = 'block';
            loginContainer.style.display = 'none';
            loginContainer.style.boxShadow = 'none'; // Remove shadow
            loginButton.style.display = 'block';
            // Hide the logged-in user info
            loggedInUser.style.display = 'none';
        }

        
    }
    
    // Check login status when the page loads
    checkLoginStatus();

    // Event listener for login form submission
    loginForm.addEventListener('submit', function (event) {
        event.preventDefault();
        // Assuming you have login logic here
        // After successful login, call the checkLoginStatus function again to hide the login form
        checkLoginStatus();
    });
});

var loggedIn = false;

        function toggleUser() {
            var userProfile = document.getElementById("userProfile");
            var loggedInUser = document.getElementById("loggedInUser");
            var loginButton = document.getElementById("loginButton");
            var logoutButton = document.getElementById("logoutButton");

            if (loggedIn) {
                // If user is logged in, log them out
                loggedIn = false;
                userProfile.style.display = "inline-block";
                loggedInUser.style.display = "none";
                logoutButton.style.display = "none";
                loginButton.style.display = "inline-block";
            } else {
                // If user is logged out, display login options
                loggedIn = true;
                userProfile.style.display = "none";
                loggedInUser.style.display = "none";
                logoutButton.style.display = "inline-block";
                loginButton.style.display = "none";
                openLoginForm(); // Open login form
            }
        }

        function logout() {
            // Perform logout action (clear session, etc.)
            // For demonstration, just toggle back to login state
            toggleUser();
        }


        document.getElementById("Profile").addEventListener("click", function() {
            var profileDiv = document.getElementById("ProfileCont");
            if (profileDiv.style.display === "none") {
                profileDiv.style.display = "block";
                const username = sessionStorage.getItem('username'); // Get the username from sessionStorage
                console.log(username);
                fetchProfileData(username); // Pass the username to the fetchProfileData function
            } else {
                profileDiv.style.display = "none";
            }
        });
        
        document.getElementById("fetchProfileBtn").addEventListener("click", function() {
            const username = sessionStorage.getItem('username'); // Get the username from sessionStorage
            fetchProfileData(username); // Call the function to fetch profile data with the username
        });
        
        function fetchProfileData(username) {
            // Construct the URL with the username as a query parameter
            const url = `http://localhost:5000/profile?username=${username}`;
        
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    if (!data || Object.keys(data).length === 0) {
                        throw new Error('Empty or malformed response');
                    }
                    populateProfileForm(data);
                })
                .catch(error => {
                    console.error('Error fetching profile data:', error);
                    alert('Error fetching profile data');
                });
        }
        
        
        function populateProfileForm(data) {
            // Populate the frontend form with data received from the backend
            document.getElementById("profileIDInput").value = data.Student_ID || '';
            document.getElementById("profileNameInput").value = data.Student_Name || '';
            document.getElementById("profileBranchInput").value = data.Branch || '';
            document.getElementById("profileBatchInput").value = data.Batch || '';
            document.getElementById("profileGenderInput").value = data.Gender || '';
            document.getElementById("profileEmailInput").value = data.Email || '';
            document.getElementById("profileCGPAInput").value = data.CGPA || '';
            document.getElementById("profileAddressInput").value = data.Address || '';
            document.getElementById("profileMotherNameInput").value = data.Mother_Name || '';
            document.getElementById("profileFatherNameInput").value = data.Father_Name || '';
            document.getElementById("profileFatherMobileInput").value = data.Father_Mobile || '';
            document.getElementById("profileBloodGroupInput").value = data.Blood_Group || '';
            
            const profilePhotoImg = document.querySelector("#profilePhotoContainer img");
            if (data.Photo) {
                profilePhotoImg.src = data.Photo; // Set the source to the photo URL from data
                console.log(data.Photo);
            } else {
                // If no photo available, display the FontAwesome user icon
                profilePhotoImg.src = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/svgs/regular/user.svg";
            }
            
            // Show the update button
            document.getElementById("updateProfileBtn").style.display = "inline-block";
        }
        
// code for update button
document.getElementById("updateProfileBtn").addEventListener("click", function() {
    // Make the form fields editable
    toggleFormEditable(true);
    // Show the submit button
    document.getElementById("submitProfileBtn").style.display = "inline-block";
    // Hide the update button
    document.getElementById("updateProfileBtn").style.display = "none";
});

document.getElementById("submitProfileBtn").addEventListener("click", function() {
    const username = sessionStorage.getItem('username'); // Get the username from sessionStorage
    updateProfile(username); // Pass the username to the updateProfile function
});

// Call toggleFormEditable initially to set the form fields as read-only
toggleFormEditable(false);

function toggleFormEditable(editable) {
    // Get all input fields in the form
    const inputs = document.querySelectorAll("#profileForm input");
    // Loop through each input field and toggle the readOnly attribute
    inputs.forEach(input => {
        input.readOnly = !editable;
    });
}

function updateProfile(username) {
    // Retrieve the updated profile details
    const updatedName = document.getElementById("profileNameInput").value;
    const updatedEmail = document.getElementById("profileEmailInput").value;
    const updatedAddress = document.getElementById("profileAddressInput").value;

    // Prepare the updated data object
    const updatedData = {
        Student_ID: username, // Include the username in the updated data
        Student_Name: updatedName,
        Email: updatedEmail,
        Address: updatedAddress
        // Add other fields as needed
    };

    // Use fetch or an AJAX request to send the updated data to the server
    fetch('http://localhost:5000/updateProfile', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(updatedData)
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        // Handle the response from the server, e.g., display a success message
        console.log('Profile updated successfully');
        // Reset the form fields to read-only state
        toggleFormEditable(false);
        // Hide the submit button
        document.getElementById("submitProfileBtn").style.display = "none";
        // Show the update button again
        document.getElementById("updateProfileBtn").style.display = "inline-block";
    })
    .catch(error => {
        console.error('Error updating profile:', error);
        // Handle errors, e.g., display an error message to the user
    });
}
