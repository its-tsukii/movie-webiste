<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        
        .confirmation {
            width: 80%;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        
        h1 {
            color: #333;
        }
        
        p {
            color: #666;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th,
        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #ddd;
            font-weight: bold;
            text-transform: uppercase;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="confirmation">
        <h1>Booking Confirmation</h1>
        <p>Your ticket(s) have been successfully booked!</p>
        <table>
            <thead>
                <tr>
                    <th>Movie</th>
                    <th>Amount (200xslot)</th>
                    <th>Slots</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td id="movie"></td>
                    <td id="amount"></td>
                    <td id="slots"></td>
                </tr>
            </tbody>
        </table>
        <!-- Modify the form to submit the data to the servlet -->
        <form id="bookingForm" method="post" action="process.jsp">
            <!-- Use hidden input fields to store the booking details -->
            <input type="hidden" id="movieInput" name="movie">
            <input type="hidden" id="amountInput" name="amount">
            <input type="hidden" id="slotsInput" name="slots">
            <!-- Add a submit button to submit the form -->
            <button id="confirmBookingBtn" type="submit" class="btn btn-primary">Confirm Booking</button>
        </form>
        <!-- Add a link to go back to the home page -->
        <button class="btn btn-secondary"><a href="index.jsp">Go To Home</a></button>
    </div>

    <script>
        window.onload = function() {
            // Retrieve booking details from sessionStorage
            let booking = JSON.parse(sessionStorage.getItem('booking'));
            
            // Check if booking details are available
            if (!booking) {
                // Handle error - Redirect to homepage or display error message
                window.location.href = 'index.jsp';
                return;
            }

            // Update hidden input fields with booking details
            document.getElementById('movieInput').value = booking.movie;
            let totalAmount = booking.seats.length * 200; // Assuming each ticket costs $200
            document.getElementById('amountInput').value = totalAmount.toFixed(2);
            let totalSlots = booking.seats.length;
            document.getElementById('slotsInput').value = totalSlots;

            // Update HTML elements with booking details for display
            document.getElementById('movie').innerText = booking.movie;
            document.getElementById('amount').innerText = totalAmount;
            document.getElementById('slots').innerText = totalSlots;

            // Add event listener to the confirm booking button
            document.getElementById('confirmBookingBtn').addEventListener('click', function(event) {
                // Perform any additional validation before form submission, if needed
                // For example, check if all required fields are filled
            });
        };
    </script>
</body>
</html>
