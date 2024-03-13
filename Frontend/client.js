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
        addCourseForm.style.display = 'none';
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
        addCourseForm.style.display = 'none';
        studentForm.style.display = 'none';
        searchInput.value = '';

    });

    queryLink.addEventListener('click', function (event) {
        event.preventDefault();
        hideContainers();
        addStudeBtn.style.display = 'none';
        searchInput.value = '';
        addCourseForm.style.display = 'none';
        studentForm.style.display = 'none';

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
                if (error.name !== 'AbortError') {
                    // alert('Failed to add student');
                    const result0 = window.confirm('Failed to add student. Do you want to retry?');
                    if (result0) {
                        // User clicked "OK"
                        // Add another student (perform the necessary actions)
                        console.log('Add another student');
                        document.getElementById("addstudentForm").reset();

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


