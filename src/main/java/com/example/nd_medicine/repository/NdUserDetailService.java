package com.example.nd_medicine.repository;
import com.example.nd_medicine.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class NdUserDetailService implements UserDetailsService
{
    @Autowired private userRep rep;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = rep.findByEmail(username);

        if (user == null){
            throw new UsernameNotFoundException("user not found");
        }

        return new NdUserDetails(user);
    }
}
