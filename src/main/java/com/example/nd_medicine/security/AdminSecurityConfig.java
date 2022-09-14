package com.example.nd_medicine.security;

import com.example.nd_medicine.repository.NdUserDetailService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@Order(1)
public class AdminSecurityConfig {

    @Bean
    public UserDetailsService userDetailsService(){
        return new NdUserDetailService();
    }

    @Bean
    public PasswordEncoder passwordEncoder (){
        return NoOpPasswordEncoder.getInstance();
    }


    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.authorizeRequests().antMatchers("/").permitAll();

        http.antMatcher("/admin/**").authorizeRequests().anyRequest().hasAnyAuthority("ADMIN")
                .and()
                .formLogin()
                    .loginPage("/admin/login")
                    .usernameParameter("email")
                    .loginProcessingUrl("/admin/login")
                    .defaultSuccessUrl("/admin/home")
                    .permitAll()
                .and()
                .logout().logoutUrl("admin/logout")
                    .logoutSuccessUrl("/");
        return http.build();
    }
}
