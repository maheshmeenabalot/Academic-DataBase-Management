document.addEventListener('DOMContentLoaded', function () {
    var studentsLink = document.querySelector('#std');

    studentsLink.addEventListener('click', function (event) {
        event.preventDefault();

        fetch('http://localhost:5000/details')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Generate HTML table and append it to the DOM
                var tableHtml = generateStudentTable(data);
                var studentDataContainer = document.querySelector('#studentData');
                studentDataContainer.innerHTML = tableHtml;
            })
            .catch(error => {
                console.error('Error fetching student data:', error);
            });
    });

    function generateStudentTable(data) {
        var tableHtml = '<table border="1">';
        tableHtml += '<tr><th>Student ID</th><th>Student Name</th><th>Branch</th><th>Batch</th><th>Gender</th><th>Email</th></tr>';
        data.forEach(function (student) {
            tableHtml += '<tr>';
            tableHtml += '<td>' + student.Student_ID + '</td>';
            tableHtml += '<td>' + student.Student_Name + '</td>';
            tableHtml += '<td>' + student.Branch + '</td>';
            tableHtml += '<td>' + student.Batch + '</td>';
            tableHtml += '<td>' + student.Gender + '</td>';
            tableHtml += '<td>' + student.Email + '</td>';
            tableHtml += '</tr>';
        });
        tableHtml += '</table>';
        return tableHtml;
    }
});



document.addEventListener('DOMContentLoaded', function () {
    var studentsLink = document.querySelector('#courses');

    studentsLink.addEventListener('click', function (event) {
        event.preventDefault();

        fetch('http://localhost:3000/details')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // Generate HTML table and append it to the DOM
                var tableHtml = generateCourseTable(data);
                var studentDataContainer = document.querySelector('#studentData');
                studentDataContainer.innerHTML = tableHtml;
            })
            .catch(error => {
                console.error('Error fetching courses data:', error);
            });
    });

    function generateCourseTable(data) {
        var tableHtml = '<table border="1">';
        tableHtml += '<tr><th>Course_code</th><th>School</th><th>Instructor_Name</th><th>Email</th></tr>';
        data.forEach(function (courses) {
            tableHtml += '<tr>';
            tableHtml += '<td>' + courses.Course_Code + '</td>';
            tableHtml += '<td>' + courses.School + '</td>';
            tableHtml += '<td>' + courses.Instructor_Name + '</td>';
            tableHtml += '<td>' + courses.Email + '</td>';
            tableHtml += '</tr>';
        });
        tableHtml += '</table>';
        return tableHtml;
    }
});
