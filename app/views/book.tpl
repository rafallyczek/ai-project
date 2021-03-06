{extends file="template.tpl"}

{block name=content}
  
    <body class="u-body">
	<header class="u-clearfix u-header u-header" id="sec-08c3">
            <div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
                <a href="{url action='show_main_page'}" class="u-image u-logo u-image-1">
                  <img src="{$conf->app_url}/assets/images/default-logo.png" class="u-logo-image u-logo-image-1">
                </a>
		
		<!-- Menu -->
                <nav class="u-menu u-menu-dropdown u-offcanvas u-menu-1">
                  <div class="menu-collapse" style="font-size: 1rem; letter-spacing: 0px;">
                    <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
                      <svg><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#menu-hamburger"></use></svg>
                      <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <defs>
                            <symbol id="menu-hamburger" viewBox="0 0 16 16" style="width: 16px; height: 16px;">
                                <rect y="1" width="16" height="2"></rect>
                                <rect y="7" width="16" height="2"></rect>
                                <rect y="13" width="16" height="2"></rect>
                            </symbol>
                        </defs>
                      </svg>
                    </a>
                  </div>
                  <div class="u-nav-container">
                    <ul class="u-nav u-unstyled u-nav-1">
                        <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="{url action='show_main_page'}" style="padding: 10px 20px;">Strona Główna</a></li>
                        <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="{url action='book_list' page=1}" style="padding: 10px 20px;">Książki</a></li>
                        {if not \core\RoleUtils::inAnyRole()}
                            <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="{url action='show_login'}" style="padding: 10px 20px;">Logowanie</a></li>
                        {/if}
                        {if \core\RoleUtils::inAnyRole()}
                            <li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="{url action='logout'}" style="padding: 10px 20px;">Wyloguj</a></li>
                        {/if}
                    </ul>
                  </div>
                  <div class="u-nav-container-collapse">
                    <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
                      <div class="u-sidenav-overflow">
                        <div class="u-menu-close"></div>
                        <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2">
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="{url action='show_main_page'}">Strona Główna</a></li>
                            <li class="u-nav-item"><a class="u-button-style u-nav-link" href="{url action='book_list' page=1}">Książki</a></li>
                            {if not \core\RoleUtils::inAnyRole()}
                                <li class="u-nav-item"><a class="u-button-style u-nav-link" href="{url action='show_login'}">Logowanie</a></li>
                            {/if}
                            {if \core\RoleUtils::inAnyRole()}
                                <li class="u-nav-item"><a class="u-button-style u-nav-link" href="{url action='logout'}">Wyloguj</a></li>
                            {/if}
                        </ul>
                      </div>
                    </div>
                    <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
                  </div>
                </nav>
            </div>
        </header> 
    
        <!-- Opis książki -->
        <section class="u-clearfix u-palette-5-dark-3 u-section-2" id="carousel_fd80">
          <div class="u-clearfix u-sheet u-sheet-1" style="min-height: 450px">
            <h1 class="u-text u-text-1">Szczegóły książki</h1>
            {if \core\RoleUtils::inRole("admin")}
                <a href="{url action='book_edit' id=$book[0]['id']}" class="u-active-white u-border-1 u-border-white u-btn u-button-style u-hover-white u-none u-text-active-palette-5-dark-3 u-text-body-alt-color u-text-hover-palette-5-dark-3 u-btn-1" style="margin-left: 0;">Edytuj książkę</a>
                <a href="{url action='delete_book' id=$book[0]['id']}" class="u-active-white u-border-1 u-border-white u-btn u-button-style u-hover-white u-none u-text-active-palette-5-dark-3 u-text-body-alt-color u-text-hover-palette-5-dark-3 u-btn-1" style="margin-left: 0;">Usuń książkę</a>
            {/if}
            <div class="u-expanded-width u-list u-list-1" style="min-height: 450px">
              <div class="u-repeater u-repeater-1" style="min-height: 450px">
                
                <div class="u-container-style u-list-item u-repeater-item" style="margin-bottom: 75px;">
                  <div class="u-container-layout u-similar-container u-container-layout-1">
                    <img src="{$book[0]['picture']}" alt="" class="u-image u-image-default u-preserve-proportions u-image-1" data-image-width="626" data-image-height="626" style="height: 375px; width: 250px;">
                    <h2 class="u-text u-text-2" style="margin-top: -375px;">{$book[0]['title']}</h2>
                    <h5 class="u-custom-font u-font-pt-sans u-text u-text-3"><span style="text-decoration: underline;">Autor:</span> {$book[0]['author']}</h5>
                    <h5 class="u-custom-font u-font-pt-sans u-text u-text-3"><span style="text-decoration: underline;">Wydanie:</span> {$book[0]['release_year']}</h5>
                    <h5 class="u-custom-font u-font-pt-sans u-text u-text-3"><span style="text-decoration: underline;">E-book:</span> {if $book[0]['e_book']==0}nie{/if}{if $book[0]['e_book']==1}tak{/if}</h5>
                    <h5 class="u-custom-font u-font-pt-sans u-text u-text-3" style="text-decoration: underline;">Opis:</h5>
                    <h6 class="u-custom-font u-font-pt-sans u-text u-text-3" style="margin-top: 0; font-size: 2rem;">{$book[0]['description']}</h6>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
        </section>
         
        <!-- Recenzje -->
        <section class="u-clearfix u-palette-5-light-3 u-section-2" id="carousel_fd80">
          <div class="u-clearfix u-sheet u-sheet-1" style="min-height: 400px">
            <h1 class="u-text u-text-1">Recenzje</h1>
            {if \core\RoleUtils::inAnyRole()}
                <a href="{url action='book_review' id=$book[0]['id']}" class="u-active-black u-border-1 u-border-black u-btn u-button-style u-hover-black u-none u-text-active-palette-5-light-3 u-text-black u-text-hover-palette-5-light-3 u-btn-1" style="margin-left: 0;">Napisz recenzję</a>
            {/if}
            
                
                {foreach $reviews as $row}
                <div class="u-container-style u-list-item u-repeater-item">
                  <div class="u-container-layout u-similar-container u-container-layout-1" style="padding-top: 0;">
                    <h2 class="u-text u-text-2" style="margin-top: 0; margin-left: 0; float: left;">{$row['username']}</h2>
                    {if $row['user_id']==\core\SessionUtils::load("user_id",true)}
                        <a href="{url action='delete_review' id=$row['id'] user_id=$row['user_id'] book_id=$book[0]['id']}}" class="pure-button pure-button-primary" style="background-color: #d22d35; margin-top: 10px; margin-left: 10px; padding: 10px;" title="Usuń recenzję"><i class="fas fa-times" style="font-size: 125%; width: 20px;"></i></a>
                    {/if}
                    <h5 class="u-custom-font u-font-pt-sans u-text u-text-3" style="margin-top: 0; margin-left: 0; clear: both;"><span style="text-decoration: underline;">Ocena:</span> {$row['score']}/10</h5>
                    <h6 class="u-custom-font u-font-pt-sans u-text u-text-3" style="margin-top: 0; margin-left: 0; font-size: 2rem;">{$row['description']}</h6>
                  </div>
                </div>
                {/foreach}
                
            
          </div>
        </section>
                
        <!-- Stopka -->
        <footer class="u-align-center u-clearfix u-footer u-palette-2-base u-footer" id="sec-8349">
            <div class="u-clearfix u-sheet u-sheet-1">
		<p class="u-small-text u-text u-text-variant u-text-1">Autor strony: Rafał Łyczek<br/>Projekt: Aplikacje Internetowe</p>
            </div>
	</footer>
	
        <section class="u-backlink u-clearfix u-grey-80">
          <p class="u-text">
            <span>Szablon strony z </span>
          </p>
          <a class="u-link" href="https://nicepage.com/website-templates" target="_blank">
            <span>Website Templates</span>
          </a>
          <p class="u-text">
            <span> z użyciem</span>
          </p>
          <a class="u-link" href="https://nicepage.com/" target="_blank">
            <span>Website Builder Software</span>
          </a>. 
        </section>
	
    </body>
{/block}