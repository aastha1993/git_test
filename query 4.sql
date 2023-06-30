select staff_id, first_name, last_name from staff
     where staff_id IN (
		 select manager_staff_id from 
		 store);