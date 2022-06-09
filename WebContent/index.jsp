<%


%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stylesheets/style.css">
    <link rel="stylesheet" href="stylesheets/particles.css">
    <link rel="stylesheet" href="stylesheets/cards.css">
    <link rel="stylesheet" href="stylesheets/navbar.css">
    <link rel="stylesheet" href="stylesheets/slider.css">
    <link rel="stylesheet" href="stylesheets/servicesectioon.css">
    <link rel="stylesheet" href="stylesheets/footer.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Document</title>


</head>

<body>

    <div class="hero" id="particle-container">
        <nav>
            <ul class="menu">
                <li class="brand">
                    <h2>
                        D-Donation✨
                    </h2>
                </li>
                <li class="item mid">
                    <i class="fa fa-home red"></i>
                    <a href="/dashboard/index.html">Explore Campaigns</a>
                </li>
                <li class="item mid">
                    <i class="fa fa-user green" aria-hidden="true"></i>
                    <a href="">Fundraise For</a>
                </li>
                <li class="item mid yellow">
                    <i class="fa fa-info-circle" aria-hidden="true"></i>
                    <a href="">How It Works</a>
                </li>
                <li class="item mid ">
                    <i class="fa fa-microphone blue" aria-hidden="true"></i>
                    <a href="">About US</a>
                </li>
                <%
                if(session.getAttribute("display")=="hide"){
                	out.print("<li class='item mid'><a href='Logout'>Logout</a></li>");
                    out.print("<li class='item mid'><a href='#'>"+session.getAttribute("name")+"</a></li>");
                    
                }else{
                	out.print("<li class='btn end'><a href='contactus.html'>Contact Us</a></li><li class='btn end'><a href='sign.jsp'>Sign In</a></li>");
                }
                
                %>
                
            </ul>
        </nav>
        <div class="particle-container">

            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
        </div>

        <div class="row">
            <div class="col-11">
                <img class="elements" src="assets/hero-bg.png" alt="">
            </div>
            <div class="col-12">
                <h1>Be The <span class="red">Change</span> <br> <span class="green">You</span> Want To See In The <span
                        class="yellow">World</span></h1>
                <a href="form.html" class="btn">Raise Fund Now</a>
                <a href="" class="btn">Donate A Needy</a>
            </div>
        </div>
        <!-- <img class="bg-row" src="/assets/row_12.png" alt=""> -->
    </div>

    <div class="guide-section">
        <div class="particle-container">

            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
        </div>
        <h2 class="second second-heading">
            Start A Fundraiser In Three Simple Steps
        </h2>
        <div class="guide-container">
            <div class="row">
                <div class="col-21">
                    <img height="450px" width="64px"
                        src="https://ketto.gumlet.io/assets/images/homepage/sac-separator.png?dpr=1.0&q=70&w=100"
                        alt="">
                    <div class="step">
                        <h3 class="blue">Start your fundraiser</h3>
                        <p>Itâll take only 2 minutes. Just tell us a few details about you and the ones you are raising
                            funds for</p>
                        <h3 class="yellow">Start your fundraiser</h3>
                        <p>Itâll take only 2 minutes. Just tell us a few details about you and the ones you are raising
                            funds for</p>
                        <h3 class="red">Start your fundraiser</h3>
                        <p id="last-para-des">Itâll take only 2 minutes. Just tell us a few details about you and the
                            ones you are raising funds for</p>

                    </div>

                </div>
                <div class="col-22">
                    <img class="elements" src="assets/guide.png" alt="">
                </div>
                <!-- <div class="button-container">
                    <a href="" class="btn">START A FUNDRAISER FOR FREE</a>
                    <a href="" class="btn">Talk to Us</a>
                </div> -->
            </div>
        </div>
    </div>
    <div class="crowdfunding">
        <h1 class="second second-heading">
            What Is CrowdFunding?
        </h1>
        <p class="second second-para">
            View the fundraisers that are most active right now
        </p>
        <div class="row">
            <div class="col-11">
                <img class="elements"
                    src="https://d2aq6dqxahe4ka.cloudfront.net/themes/neumorphism/images/Hiw-new/webp/India-Map-new.webp"
                    alt="">
            </div>
            <div class="col-11">
                <p class="defination">
                    Crowdfunding is the process of raising donations from people across the country to fund your chosen cause or treatment, within a short period of time. Unlike loans or insurance, crowdfunding requires no payback and is for everyone from a 5 month old baby to a senior citizen with critical illness.
                </p>
            </div>
        </div>
    </div>
    <div class="cards-section">
        <div class="particle-container">

            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
        </div>
        <h1 class="second second-heading">
            Trending Fundraisers
        </h1>
        <p class="second second-para">
            View the fundraisers that are most active right now
        </p>
        <div class="container">
            <div class="card">
                <div class="box">
                    <div class="content">
                        <div class="card-img">
                            <img src="assets/card-2.png" alt="">
                        </div>
                        <h3>Card One</h3>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste exercitationem dolor pariatur
                            suscipit officiis, totam ea qui optio modi unde.
                        </p>
                        <!-- <a href="" class="btn">Know More</a> -->
                        <a href="">Donate</a>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="box">
                    <div class="content">
                        <div class="card-img">
                            <img src="assets/card-3.jpg" alt="">
                        </div>
                        <h3>Card Two</h3>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste exercitationem dolor pariatur
                            suscipit officiis, totam ea qui optio modi unde.
                        </p>
                        <!-- <a href="" class="btn">Know More</a> -->
                        <a href="">Donate</a>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="box">
                    <div class="content">
                        <div class="card-img">
                            <img src="assets/card-4.jpeg" alt="">
                        </div>
                        <h3>Card Three</h3>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste exercitationem dolor pariatur
                            suscipit officiis, totam ea qui optio modi unde.
                        </p>
                        <!-- <a href="" class="btn">Know More</a> -->
                        <a href="">Donate</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="service-container">
        <h1>Our Services</h1>
        <div class="particle-container">

            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
        </div>
        <div class="row">
            <div class="service r">
                <i class="fa fa-laptop red"></i>
                <h2>Blood </h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>
            <div class="service g">
                <i class="fa fa-laptop green"></i>
                <h2>Accident </h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>
            <div class="service b">
                <i class="fa fa-laptop blue"></i>
                <h2>Natural Disaster</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>
            <div class="service p">
                <i class="fa fa-laptop pink"></i>
                <h2>Kidney </h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>
            <div class="service y">
                <i class="fa fa-laptop yellow"></i>
                <h2>NGOs</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>
            <div class="service v">
                <i class="fa fa-laptop violate"></i>
                <h2>Others</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing.</p>
            </div>

        </div>
    </div>


    <div class="slider-box">
        <!-- <h1 class="second second-heading">
            Success Stories
        </h1> -->
        <div class="particle-container">

            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
            <div class="particle"></div>
        </div>
        <div id="slider">
            <div class="row">
                <div class="col-21">
                    <img src="https://d1vdjc70h9nzd9.cloudfront.net/media/banner/0/95/image/bc5ae443b8da492ff0c97082e2981ada078e385d.jpg"
                        alt="" srcset="">
                </div>
                <div class="col-22">
                    <h2>My daughter finally gets to enjoy her childhood</h2>
                    <p>"My daughter was suffering from Budd Chiari syndrome with a recurrent gastrointestinal bleed and
                        needed an urgent liver transplant to survive, but sadly we couldn't afford it. However, your
                        donations gave her a new lease on life! She underwent a successful liver transplant and is now
                        enjoying her childhood. Words cannot express how grateful I am to you angels!" - Prajakta
                        (Mother)</p>
                    <span>Read More </span>
                </div>
            </div>
        </div>

        <div class="indicators">
            <span id="btn-1"></span>
            <span id="btn-2"></span>
            <span id="btn-3"></span>
            <span id="btn-4"></span>
            <span id="btn-5"></span>
        </div>
    </div>

    </div>
    <footer class="site-footer">

        <ul class="social-icons">
            <li><a class="facebook" href="#"><i class="fa fa-facebook"></i></a></li>
            <li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
            <li><a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a></li>
            <li><a class="linkedin" href="#"><i class="fa fa-linkedin"></i></a></li>
        </ul>
        <p class="copyright"> Donor_And_DonationÂ©2022</p>
    </footer>
    <script src="/scripts/slide.js"></script>

</body>

</html>
<!-- 
<img src="https://kettocdn.gumlet.io/media/banner/0/79/image/d0ab9b0b9bcc30ced6574c54d6b216ab895f90d5.jpg?w=auto&dpr=1.0&q=70" alt="" srcset="">
            <img src="https://kettocdn.gumlet.io/media/banner/0/96/image/0717875196afb641172a631c282e1875d76b8930.jpg?w=auto&dpr=1.0&q=70" alt="" srcset="">        
            <img src="https://kettocdn.gumlet.io/media/banner/0/97/image/50e08ce31ef3bfa184cadd9ec164b8ecee8bb0f0.jpg?w=auto&dpr=1.0&q=70" alt="" srcset="">
            <img src="https://kettocdn.gumlet.io/media/banner/0/94/image/26fe5c8a80fe779e091bd15f4de3c80224ca7c5b.jpg?w=auto&dpr=1.0&q=70" alt="" srcset="">
         -->