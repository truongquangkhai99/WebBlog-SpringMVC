//package com.laptrinhjavaweb.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//
//import com.laptrinhjavaweb.security.CustomSuccessHandler;
//import com.laptrinhjavaweb.service.impl.CustomUserDetailsService;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//
//    @Autowired
//    private CustomUserDetailsService userDetailsService;
//
//    @Autowired
//    private CustomSuccessHandler customSuccessHandler;
//
//
//    @Bean
//    public BCryptPasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//
//
//
//    @Bean
//    public DaoAuthenticationProvider authenticationProvider() {
//        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
//        authProvider.setUserDetailsService(userDetailsService);
//        authProvider.setPasswordEncoder(passwordEncoder());
//        return authProvider;
//    }
//
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) {
//        auth.authenticationProvider(authenticationProvider());
//    }
//
//
////    class CsrfMatcher implements RequestMatcher {
////        @Override
////        public boolean matches(HttpServletRequest request) {
////
////           if (request.getRequestURL().toString().indexOf("/the-loai") != -1)
////                return true;
////            return false;
////        }
////    }
////
////    private CsrfMatcher csrfRequestMatcher = new CsrfMatcher();
//
//
////    @Override
////    public void configure(WebSecurity web) throws Exception {
////        web.ignoring().antMatchers("/template/**");
////    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//
////        http.csrf().requireCsrfProtectionMatcher(csrfRequestMatcher);
//
//        http
//                .headers().disable().csrf().disable();
////                .cacheControl()
////                .contentTypeOptions()
////                .httpStrictTransportSecurity()
////                .frameOptions()
////                .xssProtection();
//
//        http
//                .authorizeRequests()
//                .antMatchers("/quan-tri/**").access("hasAnyRole('ADMIN')")
//                .antMatchers("/api/user").access("hasAnyRole('ADMIN')")
//                .antMatchers("/api/category").access("hasAnyRole('ADMIN')")
//                .antMatchers("/api/role").access("hasAnyRole('ADMIN')")
//                .antMatchers("/api/comment").access("hasAnyRole('ADMIN','WRITER','USER')")
//                .antMatchers("/api/new").access("hasAnyRole('ADMIN','WRITER')")
//                .antMatchers("/bai-viet/**").access("hasAnyRole('WRITER')")
//                .antMatchers("/dang-ky").permitAll()
//                .antMatchers("/trang-chu").permitAll()
//                .antMatchers("/xem-bai-viet").permitAll()
//                .anyRequest()
//                .authenticated()
//
//                .and()
//                .formLogin()
//                .loginPage("/dang-nhap")
//                .usernameParameter("j_username")
//                .passwordParameter("j_password")
//                .loginProcessingUrl("/j_spring_security_check")
//                .successHandler(customSuccessHandler)
//                .failureUrl("/dang-nhap?incorrectAccount")
//                .permitAll()
//
//                .and()
//                .logout()
//                .permitAll()
//
//                .and()
//                .sessionManagement()
//                .sessionFixation()
//                .newSession();
//    }
//
//
//}
//
//
//
//
