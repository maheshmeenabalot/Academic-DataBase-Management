document.addEventListener('DOMContentLoaded', function () {
    // Selecting links and containers
    var studentsLink = document.querySelector('#std');
    var coursesLink = document.querySelector('#courses');
    var queryLink = document.querySelector('#queryLink');
    var homeLink = document.querySelector('#homeLink');
    var InstList = document.querySelector('#InstList');
    var aboutUs = document.querySelector('#aboutUs');
    var studentDataContainer = document.getElementById('studentData');

    var instructorsCourse = document.getElementById('instructorCourseList');
    var addStudeBtn = document.getElementById('addStudeBtn');
    var studentForm = document.getElementById('addstudentForm');
    var enrolledStudentsContainer = document.getElementById('enrolledStudents');
    var FilterBtn = document.getElementById('filterBtn');
    var FilterForm = document.getElementById('filterForm');
    const searchInput = document.getElementById('searchbar');
    var curr_sec = 0;

    var addCourseBtn = document.getElementById('addCourseBtn');
    var addInstructorBtn = document.getElementById('addInstructorBtn');

    var viewCourse = document.querySelector('#instructor-Courses');


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
        addCourseBtn.style.display = 'none';
        addInstructorBtn.style.display = 'none';

        const userType = sessionStorage.getItem('userType');

        // Show the "Add Student" button only if the user is an admin
        if (userType === 'admin') {
            addStudeBtn.style.display = 'block';

        } else {
            addStudeBtn.style.display = 'none';
        }

    });

    coursesLink.addEventListener('click', function (event) {
        event.preventDefault();
        // addCourseBtn.style.display = 'block';
        curr_sec = 2;   // denote that we are in student section
        hideContainers();
        studentDataContainer.style.display = 'block';
        fetchCourseData();
        addStudeBtn.style.display = 'none';
        addInstructorBtn.style.display = 'none';

        searchInput.value = '';

        const userType = sessionStorage.getItem('userType');
        if (userType === 'admin') {
            addCourseBtn.style.display = 'block';
        } else {
            addCourseBtn.style.display = 'none';
        }

    });

    queryLink.addEventListener('click', function (event) {
        event.preventDefault();
        hideContainers();
        addStudeBtn.style.display = 'none';
        searchInput.value = '';

    });

    InstList.addEventListener('click', function (event) {
        event.preventDefault();
        hideContainers();
        addStudeBtn.style.display = 'none';
        addCourseBtn.style.display = 'none';
        FilterBtn.style.display = 'none';
        addInstructorBtn.style.display = 'block';
        // searchInput.value = '';
        fetchInstructors();
        // urlParams = new URLSearchParams(window.location.search);
        // if (urlParams.has('refresh')) {

        //     fetchInstructors(); // Refresh instructor table
        // }

    });

    viewCourse.addEventListener('click', function (event) {
        event.preventDefault();
        hideContainers();
        // searchInput.value = '';
        // fetchInstructors();
        studentDataContainer.style.display = 'block';

        fetchViewCourseData();


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
    // Event listener for the "filter btn" button
    FilterBtn.addEventListener('click', function (event) {
        event.preventDefault();
        hideContainers();
        searchContainer.style.display = 'none';
        addStudeBtn.style.display = 'none';
        studentForm.style.display = 'none';
        FilterForm.style.display = 'block';
    });

    addInstructorBtn.addEventListener('click', function (event) {
        event.preventDefault();
        hideContainers();
        window.location.href = `add-Instructor.html`;
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
    function fetchViewCourseData() {
        const username =sessionStorage.getItem('username');
        
        console.log(username);
        fetch(`http://localhost:5000/view-courses?username=${username}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Course data:', data);
                var tableHtml = generateCourseTable(data);
                instructorsCourse.innerHTML = tableHtml;
            })
            .catch(error => {
                console.error('Error fetching courses data:', error);
            });
    }
    function fetchInstructors() {
        fetch('http://localhost:5000/instructors')
            .then(response => response.json())
            .then(instructors => {
                const instructorList = document.getElementById('instructorList');
                instructorList.innerHTML = ''; // Clear previous content

                if (instructors.length === 0) {
                    instructorList.innerHTML = '<p>No instructors found.</p>';
                } else {
                    const table = document.createElement('table');
                    table.innerHTML = `
                        <tr>
                            <th>Instructor Name</th>
                            <th>Email</th>
                            <th>School</th>
                        </tr>
                    `;
                    instructors.forEach(instructor => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                            <td>${instructor.Instructor_Name}</td>
                            <td>${instructor.Instructor_Email}</td>
                            <td>${instructor.School}</td>
                        `;
                        table.appendChild(row);
                    });
                    instructorList.appendChild(table);
                }
            })
            .catch(error => {
                console.error('Error fetching instructors:', error);
                const instructorList = document.getElementById('instructorList');
                instructorList.innerHTML = '<p>Error fetching instructors.</p>';
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
                    showaddStudeBtnCont();

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
                    addCourseBtn.style.display = 'block';
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

    let enrolledStudentsVisible = false;
    instructorsCourse.addEventListener('click', function (event) {
        if (event.target.classList.contains('viewBtn')) {
            var courseRow = event.target.closest('tr');
            var courseCode = courseRow.cells[0].textContent;

            if (!enrolledStudentsVisible) {
                enrolledStudents.style.display = 'block';
                fetchEnrolledStudents(courseCode);
                enrolledStudentsVisible = true;
            } else {
                enrolledStudents.style.display = 'none';
                enrolledStudentsVisible = false;
            }
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


    function hideContainers() {
        studentDataContainer.innerHTML = ''; // Clear student data container
        hideEnrolledStudents();
    }



    // Function to hide containers
    function hideContainers() {
        studentDataContainer.innerHTML = ''; // Clear student data container
    }

    document.getElementById("showcoursesBtn").addEventListener("click", function () {
        // document.getElementById("courseList").style.display = "block";
        // console.log("Button clicked");
        // const studentId = sessionStorage.getItem('username');
        // console.log(studentId);
        // fetchCoursesList(studentId);
        // dfsdfdsfd
        var courseDiv = document.getElementById("courseList");
        if (courseDiv.style.display === "none") {
            courseDiv.style.display = "block";
            const studentId = sessionStorage.getItem('username'); // Get the username from sessionStorage
            console.log(studentId);
            fetchCoursesList(studentId); // Pass the username to the fetchProfileData function
        } else {
            courseDiv.style.display = "none";
        }



    });

    //**courses registration */
    const courseRegistrationBtn = document.getElementById('courseRegistrationBtn');
    courseRegistrationBtn.addEventListener('click', () => {
        window.location.href = 'http://localhost:5000/course_reg';
    });


    // 1321212131nn

});


function openLoginForm() {
    // Show login form
    const loginForm = document.getElementById('loginForm');
    loginForm.style.display = 'block';
    document.querySelector('#aboutUs').style.display = "block";

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
    const logoutButton = document.getElementById('logoutButton'); // Add this line

    // Check if the user is already logged in
    const isLoggedIn = sessionStorage.getItem('isLoggedIn') === 'true';

    if (isLoggedIn) {
        // Remove existing user information
        while (loggedInUser.firstChild) {
            loggedInUser.removeChild(loggedInUser.firstChild);
        }

        // Display the username in the navbar
        const username = sessionStorage.getItem('username');
        const userType = sessionStorage.getItem('userType');

        const userAvatar = document.createElement('i');
        userAvatar.classList.add('fa-regular', 'fa-user');
        loggedInUser.appendChild(userAvatar);
        loggedInUser.appendChild(document.createTextNode(username));
        navbar.insertBefore(loggedInUser, navbar.childNodes[0]); // Insert the "Logged in as" element at the beginning of the navbar

        // Handle UI based on user role
        handleUserRole(userType);
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
        document.querySelector('#aboutUs').style.display = 'block';
        document.querySelector('#homeLink').style.display = 'none';
        document.getElementById('searchContainer').style.display = 'none';
        // Additional logout functionality here...
    });

    loginForm.addEventListener('submit', function (event) {
        event.preventDefault();

        const username = document.getElementById('username').value;
        const password = document.getElementById('password').value;
        const userType = document.getElementById('userType').value;

        const credentials = {
            username: username,
            password: password,
            userType: userType
        };

        fetch('http://localhost:5000/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(credentials)
        })
            .then(response => {
                if (response.ok) {
                    console.log('Login successful');
                    sessionStorage.setItem('isLoggedIn', 'true');
                    sessionStorage.setItem('username', username);
                    sessionStorage.setItem('userType', userType);

                    // Only store the user type if the login is successful
                    // sessionStorage.setItem('userType', userType); // Store user type in session

                    loginContainer.style.display = 'none'; // Move this line here for all user types

                    showProtectedContent();

                    // Additional logic specific to student login
                    if (userType === 'student') {
                        console.log("Loged in as student");
                        // Fetch student details and update UI
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
                                loggedInUser.appendChild(document.createTextNode('  ' + studentName));
                                navbar.insertBefore(loggedInUser, navbar.childNodes[0]); // Insert the "Logged in as" element at the beginning of the navbar

                                // Hide the login button after successful login
                                loginButton.style.display = 'none';
                            })
                            .catch(error => {
                                console.error('Error fetching student data:', error);
                            });
                    }
                    if (userType === "admin" || userType === "instructor") {
                        console.log(`Logged in as ${userType}`);
                        loggedInUser.innerHTML = '';
                        // Update UI to display username in the navbar
                        const userAvatar = document.createElement('i');
                        userAvatar.classList.add('fa-regular', 'fa-user');
                        loggedInUser.appendChild(userAvatar);
                        loggedInUser.appendChild(document.createTextNode(' '));
                        loggedInUser.appendChild(document.createTextNode(username));
                        navbar.insertBefore(loggedInUser, navbar.childNodes[0]);

                    }
                    // Handle UI based on user role
                    handleUserRole(userType);

                } else if (response.status === 401) {
                    // Unauthorized - handle different error scenarios
                    return response.json(); // Return the error response as JSON
                }
            })
            .then(data => {
                // Handle different error scenarios based on the response
                if (data && data.error) {
                    // Display error message to the user
                    console.error('Authentication error:', data.error);
                    // You can display the error message to the user in your UI
                    alert(data.error); // Display the error message in an alert
                    loggedInUser.innerHTML = ''; // Clear the previous username from the navbar
                    loginButton.style.display = 'block'; // Show the login button again
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });
    });


    /*user ui c*/
    // Function to handle UI based on user role
    function handleUserRole(userType) {
        const userProfile = document.getElementById("userProfile");
        const logoutButton = document.getElementById("logoutButton");
        const loginButton = document.getElementById("loginButton");

       

        // Display user profile based on role
        switch (userType) {
            case 'student':
                console.log("Logged in as student");
                // Show student-related UI elements
                document.querySelector('#homeLink').style.display = "block";
                document.querySelector('#std').style.display = "none";
                document.querySelector('#courses').style.display = "none";
                document.querySelector('#queryLink').style.display = "none";
                document.querySelector('#InstList').style.display = "none";
                document.querySelector('#instructor-Courses').style.display = "none";
                document.querySelector('#aboutUs').style.display = "block";

                break;
            case 'instructor':
                console.log("Logged in as instructor");
                // Show faculty-related UI elements
                document.querySelector('#std').style.display = "none";
                document.querySelector('#homeLink').style.display = "none";
                document.querySelector('#courses').style.display = "none";
                queryLink.style.display = 'none';
                document.getElementById('addStudeBtn').style.display = "none";
                document.getElementById('addCourseBtn').style.display = "none";
                document.getElementById('addInstructorBtn').style.display = "none";
                document.querySelector('#instructor-Courses').style.display = "block";
                document.querySelector('#InstList').style.display = "none";
                document.querySelector('#aboutUs').style.display = "block";
                document.getElementById('personalDetailsDropdown').style.display = 'none';
                document.getElementById('academicDetailsDropdown').style.display = 'none';

                break;
            case 'admin':
                console.log("Logged in as admin");
                // Show admin-related UI elements
                document.querySelector('#homeLink').style.display = "none";
                document.getElementById('addStudeBtn').style.display = "block";
                document.getElementById('addCourseBtn').style.display = "block";
                document.getElementById('addInstructorBtn').style.display = "block";
                document.querySelector('#InstList').style.display = "block";
                document.querySelector('#instructor-Courses').style.display = "none";
                document.querySelector('#aboutUs').style.display = "block";
                document.getElementById('personalDetailsDropdown').style.display = 'none';
                document.getElementById('academicDetailsDropdown').style.display = 'none';

                break;
            default:
                console.error("Unknown user type");
        }
    }



});





// This event listener runs when the DOM is fully loaded
document.addEventListener('DOMContentLoaded', function () {
    const loginForm = document.getElementById('loginForm'); // Get the login form element
    const loginContainer = document.querySelector('.loginContainer'); // Get the login container element
    const loggedInUser = document.getElementById('loggedInUser'); // Get the element for displaying logged-in user info
    const loginButton = document.getElementById('loginButton'); // Get the login button element

    // Function to check login status and update UI accordingly
    function checkLoginStatus() {
        const isLoggedIn = sessionStorage.getItem('isLoggedIn') === 'true'; // Check if the user is logged in

        if (isLoggedIn) {
            // If logged in, hide the login form and login button, show the logged-in user info
            loginForm.style.display = 'none';
            loginButton.style.display = 'none';
            loggedInUser.style.display = 'block';
            // Hide the login container shadow
            loginContainer.style.boxShadow = 'none';
        } else {
            // If not logged in, show the login form and login button, hide the logged-in user info
            loginForm.style.display = 'block';
            loginButton.style.display = 'block';
            loggedInUser.style.display = 'none';
            // Show the login container shadow
            loginContainer.style.boxShadow = '0px 0px 10px rgba(0, 0, 0, 0.1)';
        }
    }

    // Check login status when the page loads
    checkLoginStatus();

    // Event listener for login form submission
    loginForm.addEventListener('submit', function (event) {
        event.preventDefault();
        // Placeholder for login logic
        // After successful login, call checkLoginStatus to update the UI
        // Simulating successful login
        sessionStorage.setItem('isLoggedIn', 'true');
        checkLoginStatus();
    });


});

// This section manages the UI state when toggling between logged-in and logged-out states
var loggedIn = false; // Initially set to false

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
        // Show the login form after logout
        document.getElementById('loginForm').style.display = 'block';
    } else {
        // If user is logged out, display login options
        loggedIn = true;
        userProfile.style.display = "none";
        loggedInUser.style.display = "none";
        logoutButton.style.display = "inline-block";
        loginButton.style.display = "none";
        // Open login form after logout
        openLoginForm();
    }
}

// Function to handle logout action
function logout() {
    // Perform logout action (clear session, etc.)
    // For demonstration, just toggle back to login state
    toggleUser();
    document.getElementById('studentData').style.display = 'none';
    document.getElementById('instructorList').style.display = 'none';
    document.getElementById('instructorList').style.display = 'none';
    document.getElementById('instructorCourseList').style.display = 'none'
    aboutUs.style.display = 'block';
    document.getElementById('loginForm').style.display = 'block';

}




document.getElementById("Profile").addEventListener("click", function () {

    const username = sessionStorage.getItem('username');

    // Navigate to profile.html and pass the username as a query parameter
    window.location.href = `profile.html?username=${username}`;
    // window.location.href = 'profile.html';
});



function fetchCoursesList(studentId) {
    fetch("http://localhost:5000/get_courses", {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ studentId: studentId })
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            displayCourses(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

function displayCourses(courses) {
    const courseListDiv = document.getElementById("courseList");
    courseListDiv.innerHTML = ""; // Clear previous content

    // Organize courses by semester and remove duplicates
    const coursesBySemester = {};
    courses.forEach(course => {
        const semesters = course.Semester.split(' '); // Split semesters into an array
        semesters.forEach(semester => {
            if (!coursesBySemester[semester]) {
                coursesBySemester[semester] = {};
            }
            // Only add the course if it hasn't been registered in this semester
            if (!coursesBySemester[semester][course.Course_Code]) {
                coursesBySemester[semester][course.Course_Code] = course;
            }
        });
    });

    // Iterate over semesters and display courses under each semester heading
    for (const semester in coursesBySemester) {
        const semesterCourses = Object.values(coursesBySemester[semester]);

        // Create semester heading
        const semesterHeading = document.createElement('h2');
        semesterHeading.textContent = `Semester ${semester} Courses`;
        courseListDiv.appendChild(semesterHeading);

        // Create table for courses
        const table = document.createElement('table');
        table.innerHTML = `
            <thead>
                <tr>
                    <th>Course Code</th>
                    <th>Instructor Name</th>
                    <th>Course Type</th>
                </tr>
            </thead>
            <tbody></tbody>
        `;
        const tbody = table.querySelector('tbody');

        // Populate table with courses
        semesterCourses.forEach(course => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${course.Course_Code}</td>
                <td>${course.Instructor_Name}</td>
                <td>${course.Course_Type}</td>
            `;
            tbody.appendChild(row);
        });

        courseListDiv.appendChild(table);
    }
}




// });

