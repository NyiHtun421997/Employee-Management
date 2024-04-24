<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Employee Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .admin-checkbox, .admin-filter-checkbox, .itdept-filter-checkbox {
            transform: scale(1.5);
        }

        button {
            margin: 20px auto;
            padding: 15px 30px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 16px;
        }

        button:hover {
            background-color: #45a049;
        }
        
        .affl-filter-container input[type="text"], .search-container input[type="text"] {
            padding: 8px;
            font-size: 16px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

		.search-container button {
            width: 100px;
            height: 40px;
            padding: 4px 10px;
            font-size: 16px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            background-color: #008CBA;
            color: white;
		 }
		
		 .search-container button:hover {
		    background-color: #005f7f;
		 }

        .container {
            display: flex;
            gap: 200px;
        }

        .search-container, .affl-filter-container, .admin-filter-container, .itdept-filter-container {
            margin: 3px;
            display: flex;
            align-items: center;
        }

        .label-text {
          font-size: 16px;
        }

        select {
          width: 60px;
          height: 30px;
        }
                
    </style>
<script>
	window.onbeforeunload = function () {
    	window.scrollTo(0, 0);
  	}
	
	document.addEventListener("DOMContentLoaded", function() {
		filter();
		// Check if the page was reloaded due to a successful update
		const isUpdateSuccessful = sessionStorage.getItem('updateSuccessful');
		if (isUpdateSuccessful) {
		  // Display the update success message
		  document.getElementById('updateMessageSuccess').style.display = 'block';
		  // Remove the flag from session storage
		  sessionStorage.removeItem('updateSuccessful');
		}
	});
	
  function updateDatabase() {
    const updatedEmployees = [];
    const rows = document.querySelectorAll('tbody tr');
    rows.forEach(row => {
      const employeeId = row.querySelector('.employee-id').textContent;
      const isAdminCheckbox = row.querySelector('.admin-checkbox');
      const initialAdminCheckbox = row.querySelector('.initial-admin');
      const isAdmin = isAdminCheckbox.checked;
      const initialIsAdmin = initialAdminCheckbox.textContent.trim();
      if (isAdmin.toString() !== initialIsAdmin) {
        updatedEmployees.push({ empId: employeeId, isAdmin: isAdmin });
      } 
    });

    fetch('/in28Minutes-first-webapp/spring-mvc/admin/update_employees', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json' 
      },
      body: JSON.stringify(updatedEmployees)
    })
    .then(response => {
      if (response.ok) {
     	// Store flag in session storage
        sessionStorage.setItem('updateSuccessful', true);
        setTimeout(function() {
            window.location.reload();
        }, 250);
      } else {
        document.getElementById('updateMessageSuccess').style.display = 'none';
        document.getElementById('updateMessageError').style.display = 'block';
        document.getElementById('updateMessageException').style.display = 'none';
      }
    })
    .catch(error => {
      document.getElementById('updateMessageSuccess').style.display = 'none';
      document.getElementById('updateMessageError').style.display = 'none';
      document.getElementById('updateMessageException').style.display = 'block';
    });
  }
  function searchByName() {
	document.getElementById('updateMessageSuccess').style.display = 'none';
    document.getElementById('updateMessageError').style.display = 'none';
    document.getElementById('updateMessageException').style.display = 'none';
    
	document.getElementById('affiliationCode').value = '';
	document.getElementById('adminFilter').checked = false;
	
    const searchKeyword = document.getElementById('searchName').value.toLowerCase();
    const rows = document.querySelectorAll('tbody tr');
    rows.forEach(row => {
      const nameTd = row.querySelector('.employee-name');
      const idTd = row.querySelector('.employee-id');
      const display = (nameTd.textContent.toLowerCase().includes(searchKeyword) || idTd.textContent.toLowerCase().includes(searchKeyword) || searchKeyword === '') ? '' : 'none';
      row.style.display = display;
    });
  }
  function filter() {
	  	document.getElementById('updateMessageSuccess').style.display = 'none';
	    document.getElementById('updateMessageError').style.display = 'none';
	    document.getElementById('updateMessageException').style.display = 'none';
	    
	    const affiliationCode = document.getElementById('affiliationCode').value;
	    const adminCheckbox = document.getElementById('adminFilter');
	    const searchKeyword = document.getElementById('searchName').value.toLowerCase();
	    const rows = document.querySelectorAll('tbody tr');
	    const itDeptChecked = document.getElementById('itdeptFilter').checked;
	    if (adminCheckbox.checked) {
	    	rows.forEach(row => {
	    		const affiliationTd = row.querySelector('.affiliation-code');
	    		const adminFlag = row.querySelector('.admin-checkbox').checked;
	    		const nameTd = row.querySelector('.employee-name');
	    	    const idTd = row.querySelector('.employee-id');
	    		var display = 'none';
	    		if (nameTd.textContent.toLowerCase().includes(searchKeyword) || idTd.textContent.toLowerCase().includes(searchKeyword) || searchKeyword === '') {
					// it department filter
	    			if (itDeptChecked|| affiliationTd.textContent !== '692') {
	    				if (adminFlag && affiliationCode === '') {
					        display = '';
					    }
		    			if (adminFlag && affiliationCode === affiliationTd.textContent) {
						    display = '';
						}
	    			}
			    }
	            row.style.display = display;
		  	});
		} else {
			rows.forEach(row => {
	    		const affiliationTd = row.querySelector('.affiliation-code');
	    		const nameTd = row.querySelector('.employee-name');
	    	    const idTd = row.querySelector('.employee-id');
	    		var display = 'none';
	    		if (nameTd.textContent.toLowerCase().includes(searchKeyword) || idTd.textContent.toLowerCase().includes(searchKeyword) || searchKeyword === '') {
	    			// it department filter
	    			if (itDeptChecked || affiliationTd.textContent !== '692') {
	    				if (affiliationCode === '') {
					        display = '';
					    }
					    if (affiliationCode === affiliationTd.textContent) {
						    display = '';
						}
		    		}
			    }
	            row.style.display = display;
		  	});
		}
	    
	}
</script>
</head>
<body>
  <h1>Employee Management</h1>
  
  <div id="updateMessageSuccess" style="display: none; color: green;">Update completed successfully!</div>
  <div id="updateMessageError" style="display: none; color: red;">Failed to update database</div>
  <div id="updateMessageException" style="display: none; color: red;">Error occurred while updating database</div>

    <div class="container">
      <div class="search-container">
        <label class="filter-labels" for="searchName">Search by Name:</label>
        <input type="text" id="searchName">
        <button onclick="searchByName()">Search</button>
      </div>
      <div class="affl-filter-container">
            <label class="filter-labels" for="affiliationCode">Filter by Affiliation Code:</label>
            <select id="affiliationCode" onchange="filter()">
                <option value="">-</option>
                <c:forEach var="afflCd" items="${afflCodes}">
                    <option value="${afflCd}">${afflCd}</option>
                </c:forEach>
            </select>
        </div>
        <div class="admin-filter-container">
            <label class="filter-labels" for="adminFilter">Show only with Admin Flag:</label>
            <input class="admin-filter-checkbox" type="checkbox" id="adminFilter" onchange="filter()">
        </div>
        <div class="itdept-filter-container">
            <label class="filter-labels" for="itdeptFilter">Show IT Department:</label>
            <input class="itdept-filter-checkbox" type="checkbox" id="itdeptFilter" onchange="filter()">
        </div>
    </div>

  <table>
    <thead>
      <tr>
        <th>Employee Id</th>
        <th>Name</th>
        <th>Admin Flag</th>
        <th>Affliation Code</th>
        <th hidden>Initial Admin Flag</th>
      </tr>
    </thead>
    <tbody>
      <!-- JSP code to render employee data -->
      <c:forEach var="employee" items="${employees}">
        <tr>
          <td class="employee-id">${employee.empId}</td>
          <td class="employee-name">${employee.name}</td>
          <td><input type="checkbox" class="admin-checkbox" ${employee.isAdmin ? 'checked' : ''}></td>
          <td class="affiliation-code">${employee.afflCd}</td>
          <td class="initial-admin" hidden>${employee.isAdmin}</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
  <button onclick="updateDatabase()">Update</button>
</body>
</html>
