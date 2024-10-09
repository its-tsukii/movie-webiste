<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Booking</title>
    <style>
        body {
            width: 100%;
            height: 100vh;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .center {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(
                to right,
                rgb(162, 216, 162),
                rgb(102, 194, 102)
            );
        }
        .tickets {
            width: 550px;
            height: fit-content;
            border: 0.4mm solid rgba(0, 0, 0, 0.08);
            border-radius: 3mm;
            box-sizing: border-box;
            padding: 10px;
            font-family: Arial, sans-serif;
            max-height: 96vh;
            overflow: auto;
            background: white;
            box-shadow: 0px 25px 50px -12px rgba(0, 0, 0, 0.25);
        }
        .ticket-selector {
            background: rgb(243, 243, 243);
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-direction: column;
            box-sizing: border-box;
            padding: 20px;
        }
        .head {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
        }
        .title {
            font-size: 16px;
            font-weight: 600;
        }
        .seats {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            min-height: 150px;
            position: relative;
        }
        .status {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
        }
        .seats::before {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translate(-50%, 0);
            width: 220px;
            height: 7px;
            background: rgb(141, 198, 255);
            border-radius: 0 0 3mm 3mm;
            border-top: 0.3mm solid rgb(180, 180, 180);
        }
        .item {
            font-size: 12px;
            position: relative;
        }
        .item::before {
            content: "";
            position: absolute;
            top: 50%;
            left: -12px;
            transform: translate(0, -50%);
            width: 10px;
            height: 10px;
            background: rgb(255, 255, 255);
            outline: 0.2mm solid rgb(120, 120, 120);
            border-radius: 0.3mm;
        }
        .item:nth-child(2)::before {
            background: rgb(180, 180, 180);
            outline: none;
        }
        .item:nth-child(3)::before {
            background: rgb(28, 185, 120);
            outline: none;
        }
        .all-seats {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            grid-gap: 15px;
            margin: 60px 0;
            margin-top: 20px;
            position: relative;
        }
        .seat {
            width: 20px;
            height: 20px;
            background: white;
            border-radius: 0.5mm;
            outline: 0.3mm solid rgb(180, 180, 180);
            cursor: pointer;
        }
        .all-seats input:checked + label {
            background: rgb(28, 185, 120);
            outline: none;
        }
        .seat.booked {
            background: rgb(180, 180, 180);
            outline: none;
            pointer-events: none;
        }
        input {
            display: none;
        }
        .timings {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-top: 30px;
        }
        .dates {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .dates-item {
            width: 50px;
            height: 40px;
            background: rgb(233, 233, 233);
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 10px 0;
            border-radius: 2mm;
            cursor: pointer;
        }
        .day {
            font-size: 12px;
        }
        .times {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 10px;
        }
        .time {
            font-size: 14px;
            width: fit-content;
            padding: 7px 14px;
            background: rgb(233, 233, 233);
            border-radius: 2mm;
            cursor: pointer;
        }
        .timings input:checked + label {
            background: rgb(28, 185, 120);
            color: white;
        }
        .price {
            width: 100%;
            box-sizing: border-box;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .total {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;
            font-size: 16px;
            font-weight: 500;
        }
        .total span {
            font-size: 11px;
            font-weight: 400;
        }
        .price button {
            background: rgb(60, 60, 60);
            color: white;
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 7px 14px;
            border-radius: 2mm;
            outline: none;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="center">
        <div class="tickets">
            <div class="ticket-selector">
                <div class="head">
                    <div class="title">Currently Playing Below</div>
                    <p>!! Per Ticket - 200 rs. !!</p>
                </div>
                <div class="movie-selection">
                    <label for="movie">Select Movie:</label>
                    <select id="movie">
                        <option value="Select A Movie Please">--None--</option>
                        <!-- JSP code to fetch movie list from database -->
                        <% 
                            Connection conn = null;
                            Statement stmt = null;
                            ResultSet rs = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");
                                stmt = conn.createStatement();
                                rs = stmt.executeQuery("SELECT movies FROM addedmovies");
                                while (rs.next()) {
                                    String movieName = rs.getString("movies");
                        %>
                                    <option value="<%= movieName %>"><%= movieName %></option>
                        <% 
                                }
                            } catch (SQLException ex) {
                                ex.printStackTrace();
                            } finally {
                                try {
                                    if (rs != null) rs.close();
                                    if (stmt != null) stmt.close();
                                    if (conn != null) conn.close();
                                } catch (SQLException ex) {
                                    ex.printStackTrace();
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="seats">
                    <div class="status">
                        <div class="item">Available</div>
                        <div class="item">Booked</div>
                        <div class="item">Selected</div>
                    </div>
                    <div class="all-seats">
                        <input type="checkbox" name="tickets" id="s1" disabled />
                        <label for="s1" class="seat booked"></label>
                        <input type="checkbox" name="tickets" id="s2" disabled />
                        <label for="s2" class="seat booked"></label>
                        <input type="checkbox" name="tickets" id="s3" disabled />
                        <label for="s3" class="seat booked"></label>
                        <input type="checkbox" name="tickets" id="s4" />
                        <label for="s4" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s5" />
                        <label for="s5" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s6" />
                        <label for="s6" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s7" />
                        <label for="s7" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s8" />
                        <label for="s8" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s9" />
                        <label for="s9" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s10" />
                        <label for="s10" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s11" />
                        <label for="s11" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s12" />
                        <label for="s12" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s13" />
                        <label for="s13" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s14" />
                        <label for="s14" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s15" />
                        <label for="s15" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s16" />
                        <label for="s16" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s17" />
                        <label for="s17" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s18" />
                        <label for="s18" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s19" />
                        <label for="s19" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s20" disabled />
                        <label for="s20" class="seat booked"></label>
                        <input type="checkbox" name="tickets" id="s21" />
                        <label for="s21" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s22" />
                        <label for="s22" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s23" />
                        <label for="s23" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s24" />
                        <label for="s24" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s25" />
                        <label for="s25" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s26" />
                        <label for="s26" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s27" />
                        <label for="s27" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s28" />
                        <label for="s28" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s29" />
                        <label for="s29" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s30" />
                        <label for="s30" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s31" />
                        <label for="s31" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s32" disabled />
                        <label for="s32" class="seat booked"></label>
                        <input type="checkbox" name="tickets" id="s33" disabled />
                        <label for="s33" class="seat booked"></label>
                        <input type="checkbox" name="tickets" id="s34" />
                        <label for="s34" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s35" />
                        <label for="s35" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s36" />
                        <label for="s36" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s37" disabled />
                        <label for="s37" class="seat booked"></label>
                        <input type="checkbox" name="tickets" id="s38" />
                        <label for="s38" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s39" disabled />
                        <label for="s39" class="seat booked"></label>
                        <input type="checkbox" name="tickets" id="s40" />
                        <label for="s40" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s41" disabled />
                        <label for="s41" class="seat booked"></label>
                        <input type="checkbox" name="tickets" id="s42" />
                        <label for="s42" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s43" />
                        <label for="s43" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s44" />
                        <label for="s44" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s45" />
                        <label for="s45" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s46" />
                        <label for="s46" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s47" />
                        <label for="s47" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s48" />
                        <label for="s48" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s49" />
                        <label for="s49" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s50" />
                        <label for="s50" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s51" />
                        <label for="s51" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s52" />
                        <label for="s52" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s53" />
                        <label for="s53" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s54" disabled />
                        <label for="s54" class="seat booked"></label>
                        <input type="checkbox" name="tickets" id="s55" />
                        <label for="s55" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s56" />
                        <label for="s56" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s57" />
                        <label for="s57" class="seat"></label>
                        <input type="checkbox" name="tickets" id="s58" disabled />
                        <label for="s58" class="seat booked"></label>
                        <input type="checkbox" name="tickets" id="s59" />
                        <label for="s59" class="seat"></label>
                    </div>
                </div>
                <div class="timings">
                    <div class="timings">
                    <div class="dates">
                        <input type="radio" name="date" id="d1" checked />
                        <label for="d1" class="dates-item">
                            <div class="day">Sun</div>
                            <div class="date">11</div>
                        </label>
                        <input type="radio" id="d2" name="date" />
                        <label class="dates-item" for="d2">
                            <div class="day">Mon</div>
                            <div class="date">12</div>
                        </label>
                        <input type="radio" id="d3" name="date" />
                        <label class="dates-item" for="d3">
                            <div class="day">Tue</div>
                            <div class="date">13</div>
                        </label>
                        <input type="radio" id="d4" name="date" />
                        <label class="dates-item" for="d4">
                            <div class="day">Wed</div>
                            <div class="date">14</div>
                        </label>
                        <input type="radio" id="d5" name="date" />
                        <label class="dates-item" for="d5">
                            <div class="day">Thu</div>
                            <div class="date">15</div>
                        </label>
                        <input type="radio" id="d6" name="date" />
                        <label class="dates-item" for="d6">
                            <div class="day">Fri</div>
                            <div class="date">16</div>
                        </label>
                        <input type="radio" id="d7" name="date" />
                        <label class="dates-item" for="d7">
                            <div class="day">Sat</div>
                            <div class="date">17</div>
                        </label>
                    </div>
                    <div class="times">
                        <input type="radio" name="time" id="t1" checked />
                        <label for="t1" class="time">11:00</label>
                        <input type="radio" id="t2" name="time" />
                        <label for="t2" class="time">14:30</label>
                        <input type="radio" id="t3" name="time" />
                        <label for="t3" class="time">18:00</label>
                        <input type="radio" id="t4" name="time" />
                        <label for="t4" class="time">21:30</label>
                    </div>
                </div>
            </div>
            <div class="price">
                <div class="total">
                    <span><span class="count">0</span> Tickets</span>
                    <div class="amount">0</div>
                </div>
                <button type="button" id="book-btn">Book</button>
            </div>
        </div>
    </div>
    
    <script>
   
    // Add this script to the first HTML code
    bookBtn.addEventListener('click', () => {
        let movie = document.getElementById('movie').value;
        let date = document.querySelector('input[name="date"]:checked').value;
        let time = document.querySelector('input[name="time"]:checked').value;
        let seat = document.querySelector('input[name="seat"]:checked').value;

        // Serialize selected seats data
        let selectedSeatDetails = [];
        selectedSeats.forEach(seat => {
            selectedSeatDetails.push({
                row: seat.dataset.row,
                column: seat.dataset.column
            });
        });

        // Create booking object
        let booking = {
            movie: movie,
            date: date,
            time: time,
            seats: selectedSeatDetails
        };

        // Store booking object in sessionStorage
        sessionStorage.setItem('booking', JSON.stringify(booking));

        // Redirect to confirmation page
        window.location.href = 'confirmation.jsp';
    });
</script>

<script>
        // Select and cache the necessary DOM elements
        const allSeats = document.querySelectorAll('.seat');
        const bookButton = document.getElementById('book-btn');
        const totalCount = document.querySelector('.count');
        const totalAmount = document.querySelector('.amount');

        // Initialize an empty array to store selected seats
        let selectedSeats = [];

        // Add event listener to each seat
        allSeats.forEach((seat) => {
            seat.addEventListener('click', () => {
                if (seat.classList.contains('booked')) {
                    return;
                }

                seat.classList.toggle('selected');

                updateSelectedSeats();
            });
        });

        // Function to update total count and amount
        function updateSelectedSeats() {
            selectedSeats = Array.from(document.querySelectorAll('.seat.selected'));

            totalCount.innerText = selectedSeats.length;
            totalAmount.innerText = selectedSeats.length * 200;

            if (selectedSeats.length === 0) {
                bookButton.disabled = true;
            } else {
                bookButton.disabled = false;
            }
        }

        // Add event listener to the book button
        bookButton.addEventListener('click', () => {
            // Get the selected movie, date, and time
            const movie = document.getElementById('movie').value;
            //const slots = document.getElementById('count').value;
            //const amount = document.getElementById('amount').value;
            const date = document.querySelector('input[name="date"]:checked').value;
            const time = document.querySelector('input[name="time"]:checked').value;

            // Serialize selected seats data
            const selectedSeatDetails = [];
            selectedSeats.forEach((seat) => {
                selectedSeatDetails.push({
                    row: seat.dataset.row,
                    column: seat.dataset.column
                });
            });

            // Create booking object
            const booking = {
                movie: movie,
              //  slots: slots,
              //  amount: amount,
                date: date,
                time: time,
                seats: selectedSeatDetails
            };

            // Store booking object in sessionStorage
            sessionStorage.setItem('booking', JSON.stringify(booking));

            // Redirect to confirmation page
            window.location.href = 'confirmation.jsp';
        });
    </script>
</body>
</html>
