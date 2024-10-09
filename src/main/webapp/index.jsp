<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FilmFiesta - Movie-Booking , Premiers & More</title>
	<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<style>
        .loggedInUsername {
            position: fixed;
            bottom: 100px;
            right: 10px;
            background-color: rgba(255, 255, 255, 0.7);
            padding: 0px 0px;
            border-radius: 100px;
        }
    </style>


  <!-- 
    - favicon
  -->
  <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">

  <!-- 
    - custom css link
  -->
  <link rel="stylesheet" href="./assets/css/style.css">

  <!-- 
    - google font link
  -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<body id="top">

  <!-- 
    - #HEADER
  -->

  <header class="header" data-header>
    <div class="container">

      <div class="overlay" data-overlay></div>

      <a href="./index.jsp" class="logo">
        <img src="./assets/images/logo.svg" alt="FilmFiesta logo" style="width:96px;height:96px;">>
        
      </a>

      <div class="header-actions">

       <!--
          <button class="search-btn" onclick="searchOnWeb()">
  		<ion-icon name="search-outline"></ion-icon>
		</button>
		-->


        <div class="lang-wrapper">
    <label for="language">
      <ion-icon name="globe-outline"></ion-icon>
    </label>
    <select name="language" id="language" onchange="translatePage(this.value)">
      <option value="en">English-USA</option>
      <option value="uk">English-UK</option>
      <option value="in">English-IN</option>
      <option value="ar">Arabic</option>
      <option value="zh">Mandarin</option>
      <option value="es">Spanish</option>
      <option value="fr">French</option>
      <option value="ja">Japanese</option>
      <option value="hi">Hindi</option>
      <option value="de">Deutsch</option>
      <option value="pt">Portuguese</option>
      <option value="ko">Korean</option>
      <option value="el">Greek</option>
    </select>
  </div>
  <div id="google_translate_element"></div>
		 <%
        String username = (String) session.getAttribute("username");
        if (username != null) {
    %>
    		 <form action="AccountServlet" method="get">
            <div class="loggedInUsername">
              <button type="submit" class="btn btn-primary">  A/c: <%= username %></button>
            </div>
            </form>
    <%
        } else {
            response.sendRedirect("login.jsp");
        }
    %>
      </div>

      <button class="menu-open-btn" data-menu-open-btn>
        <ion-icon name="reorder-two"></ion-icon>
      </button>

      <nav class="navbar" data-navbar>

        <div class="navbar-top">

          <a href="./index.jsp" class="logo">
            <img src="./assets/images/logo.svg" alt="FilmFiesta logo">
          </a>

          <button class="menu-close-btn" data-menu-close-btn>
            <ion-icon name="close-outline"></ion-icon>
          </button>

        </div>

        <ul class="navbar-list">

          <li>
            <a href="./index.jsp" class="navbar-link">Home</a>
          </li>

          <li>
            <a href="./tickets.jsp" class="navbar-link">Tickets</a>
          </li>

          <li>
            <a href="./recommendation.html" class="navbar-link">Recommendations</a>
          </li>

          <li>
            <a href="./deals.jsp" class="navbar-link">Exclusive Deals</a>
          </li>

        </ul>

        <ul class="navbar-social-list">

          <li>
            <a href="#" class="navbar-social-link">
              <ion-icon name="logo-twitter"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="navbar-social-link">
              <ion-icon name="logo-facebook"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="navbar-social-link">
              <ion-icon name="logo-pinterest"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="navbar-social-link">
              <ion-icon name="logo-instagram"></ion-icon>
            </a>
          </li>

          <li>
            <a href="#" class="navbar-social-link">
              <ion-icon name="logo-youtube"></ion-icon>
            </a>
          </li>

        </ul>

      </nav>

    </div>
  </header>





  <main>
    <article>

      <!-- 
        - #HERO
      -->

      <section class="hero">
        <div class="container">

          <div class="hero-content">

            <p class="hero-subtitle">FilmFiesta</p>

            <h1 class="h1 hero-title">
              Movie-Booking <strong>Premiers</strong>, & More.
            </h1>

            <div class="meta-wrapper">

              <div class="badge-wrapper">
                <div class="badge badge-fill">PG 18</div>

                <div class="badge badge-outline">Blue-Ray(In Available Theaters Only)</div>
              </div>

              <div class="ganre-wrapper">
                <a href="#">Book At FilmFiesta.com,</a>

                <a href="#">(Available In Select Cities Only)</a>
              </div>

              <div class="date-time">

                <div>
                  <ion-icon name="calendar-outline"></ion-icon>

                  <time datetime="2022">2022</time>
                </div>

                <div>
                  <ion-icon name="time-outline"></ion-icon>

                  <time datetime="PT128M">03:00 PM</time>
                </div>

              </div>

            </div>

            <button class="btn btn-primary">
              <ion-icon name="radio"></ion-icon>
			 <a href='tickets.jsp'>
              <span> Book Now</span>
             </a>
            </button>

          </div>

        </div>
      </section>





      <!-- 
        - #UPCOMING
      -->

      <section class="upcoming">
        <div class="container">

          <div class="flex-wrapper">

            <div class="title-wrapper">
              <p class="section-subtitle">Book Now</p>

              <h2 class="h2 section-title">Premiers </h2>
            </div>

            <ul class="filter-list">

              <li>
                <button class="filter-btn">Movies</button>
              </li>

              <li>
                <button class="filter-btn">TV Shows</button>
              </li>

              <li>
                <button class="filter-btn">Animations</button>
              </li>

            </ul>

          </div>

          <ul class="movies-list  has-scrollbar">

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/upcoming-1.png" alt="The Northman movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">The Northman</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Blue-Ray(In Available Theaters Only)</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT137M">12:00 AM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>8.5</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/upcoming-2.png"
                      alt="Doctor Strange in the Multiverse of Madness movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">Doctor Strange in the Multiverse of Madness</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Discounts Available !</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT126M">09:00 AM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>NR</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/upcoming-3.png" alt="Memory movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">Memory</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Discounts Available !</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="">Yet To Be Releasesd</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>NR</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/upcoming-4.png"
                      alt="The Unbearable Weight of Massive Talent movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">The Unbearable Weight of Massive Talent</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Blue-Ray(In Available Theaters Only)</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT107M">06:00 AM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>NR</data>
                  </div>
                </div>

              </div>
            </li>

          </ul>

        </div>
      </section>

      <!-- 
        - #TOP RATED
      -->

      <section class="top-rated">
        <div class="container">

          <p class="section-subtitle">Pre-Book Now</p>

					<h2 class="h2 section-title">Upcoming Premiers</h2>

					<ul class="filter-list">

            <li>
              <button class="filter-btn">Movies</button>
            </li>

            <li>
              <button class="filter-btn">TV Shows</button>
            </li>

            <li>
              <button class="filter-btn">Documentary</button>
            </li>

            <li>
              <button class="filter-btn">Sports</button>
            </li>

          </ul>

          <ul class="movies-list">

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/movie-1.png" alt="Sonic the Hedgehog 2 movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">Sonic the Hedgehog 2</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Discounts Available !</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT122M">09:00 AM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>7.8</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/movie-2.png" alt="Morbius movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">Morbius</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Blue-Ray(In Available Theaters Only)</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT104M">06:00 Am</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>5.9</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/movie-3.png" alt="The Adam Project movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">The Adam Project</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Discounts Available !</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT106M">03:00 AM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>7.0</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/movie-4.png" alt="Free Guy movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">Free Guy</h3>
                  </a>

                  <time datetime="2021">2021</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Discounts Available !</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT115M">12:00 PM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>7.7</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/movie-5.png" alt="The Batman movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">The Batman</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Discounts Available !</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT176M">09:00 PM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>7.9</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/movie-6.png" alt="Uncharted movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">Uncharted</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Blue-Ray(In Available Theaters Only)</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT116M">06:00 PM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>7.0</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/movie-7.png" alt="Death on the Nile movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">Death on the Nile</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Discounts Available !</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT127M">03:00 PM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>6.5</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/movie-8.png" alt="The King's Man movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">The King's Man</h3>
                  </a>

                  <time datetime="2021">2021</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Blue-Ray(In Available Theaters Only)</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT131M">12:00 PM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>7.0</data>
                  </div>
                </div>

              </div>
            </li>

          </ul>

        </div>
      </section>





      <!-- 
        - #TV SERIES
      -->

      <section class="tv-series">
        <div class="container">

          <p class="section-subtitle">A Glimpse Before You Decide</p>

          <h2 class="h2 section-title">Teaser</h2>

          <ul class="movies-list">

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/series-1.png" alt="Moon Knight movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">Moon Knight</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Discounts Available !</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT47M">03:00 AM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>8.6</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/series-2.png" alt="Halo movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">Halo</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Discounts Available !</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT59M">06:00 AM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>8.8</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/series-3.png" alt="Vikings: Valhalla movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">Vikings: Valhalla</h3>
                  </a>

                  <time datetime="2022">2022</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Discounts Available !</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT51M">09:00 AM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>8.3</data>
                  </div>
                </div>

              </div>
            </li>

            <li>
              <div class="movie-card">

                <a href="./tickets.jsp">
                  <figure class="card-banner">
                    <img src="./assets/images/series-4.png" alt="Money Heist movie poster">
                  </figure>
                </a>

                <div class="title-wrapper">
                  <a href="./tickets.jsp">
                    <h3 class="card-title">Money Heist</h3>
                  </a>

                  <time datetime="2017">2017</time>
                </div>

                <div class="card-meta">
                  <div class="badge badge-outline">Discounts Available !</div>

                  <div class="duration">
                    <ion-icon name="time-outline"></ion-icon>

                    <time datetime="PT70M">12:00 AM</time>
                  </div>

                  <div class="rating">
                    <ion-icon name="star"></ion-icon>

                    <data>8.3</data>
                  </div>
                </div>

              </div>
            </li>

          </ul>

        </div>
      </section>

  <!-- 
    - #FOOTER
  -->

  <footer class="footer">

    <div class="footer-top">
      <div class="container">

        <div class="divider"></div>

        <div class="quicklink-wrapper">

          <ul class="social-list">

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-facebook"></ion-icon>
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-twitter"></ion-icon>
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-pinterest"></ion-icon>
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-linkedin"></ion-icon>
              </a>
            </li>

          </ul>

        </div>

      </div>
    </div>

    <div class="footer-bottom">
      <div class="container">

        <p class="copyright">
          &copy; 2024 <a href="https://www.instagram.com/i_am_aayush_k/">Aayush S kukade</a>. All Rights Reserved
        </p>
        <p>Project Members : <br></p>
        <p>Aayush S Kukade , <br></p>
        <p>Aditya Jogi , <br></p>
        <p>Aakanksha Gehi , <br></p>
        <p>Aishwarya Deshmukh , <br></p>
		<p><a href="https://www.instagram.com/mr_struggle_360/"> Sangharsh V Bodhe . </a><br></p>
		
      </div>
    </div>

  </footer>





  <!-- 
    - #GO TO TOP
  -->

  <a href="#top" class="go-top" data-go-top>
    <ion-icon name="chevron-up"></ion-icon>
  </a>


  <!-- 
    - custom js link
  -->
  <script src="./assets/js/script.js"></script>

  <!-- 
    - ionicon link
  -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
	<script>
  function translatePage(language) {
    var translator = new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
    translator.getSourceLanguage = function() {
      return 'en';
    };
    translator.getTargetLanguage = function() {
      return language;
    };
    translator.showBanner(false);
  }
</script>
	
</body>

</html>