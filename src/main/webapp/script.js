// Ticket booking page
let seats = document.querySelectorAll('.seat');
let bookBtn = document.getElementById('book-btn');
let totalCount = document.querySelector('.count');
let totalAmount = document.querySelector('.amount');

let selectedSeats = [];

seats.forEach((seat) => {
    seat.addEventListener('click', () => {
        if (seat.classList.contains('booked')) {
            return;
        }

        seat.classList.toggle('selected');

        if (seat.classList.contains('selected')) {
            selectedSeats.push(seat);
            totalCount.innerHTML = selectedSeats.length;
            totalAmount.innerHTML = selectedSeats.length * 200;
            bookBtn.disabled = false;
        } else {
            let index = selectedSeats.indexOf(seat);
            selectedSeats.splice(index, 1);
            totalCount.innerHTML = selectedSeats.length;
            totalAmount.innerHTML = selectedSeats.length * 200;

            if (selectedSeats.length === 0) {
                bookBtn.disabled = true;
            }
        }
    });
});

bookBtn.addEventListener('click', () => {
    let movie = document.getElementById('movie').value;
    let date = document.querySelector('input[name="date"]:checked').value;
    let time = document.querySelector('input[name="time"]:checked').value;

    // Save the booking details in a form data object
    let formData = new FormData();
    formData.append('movie', movie);
    formData.append('date', date);
    formData.append('time', time);

    selectedSeats.forEach((seat, index) => {
        formData.append(`selectedSeats[${index}]`, seat.dataset.row + '-' + seat.dataset.column);
    });

    // Send the form data to the server using AJAX
    let xhr = new XMLHttpRequest();
    xhr.open('POST', 'confirmation.jsp');
    xhr.send(formData);

    xhr.onload = function() {
        if (xhr.status === 200) {
            // Redirect the user to the confirmation page with the booking details
            window.location.href = 'confirmation.jsp?booking=' + xhr.responseText;
        } else {
            console.log('Error: ' + xhr.statusText);
        }
    };
});

// Confirmation page
let queryString = window.location.search;
let urlParams = new URLSearchParams(queryString);
let booking = urlParams.get('booking');

if (booking) {
    let bookingData = JSON.parse(decodeURIComponent(booking));

    document.getElementById('movie').innerHTML = bookingData.movie;
    document.getElementById('date').innerHTML = bookingData.date;
    document.getElementById('time').innerHTML = bookingData.time;
    document.getElementById('seats').innerHTML = bookingData.selectedSeats.join(', ');
}
