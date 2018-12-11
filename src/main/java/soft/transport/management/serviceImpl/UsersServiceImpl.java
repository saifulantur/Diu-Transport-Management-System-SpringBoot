package soft.transport.management.serviceImpl;

import soft.transport.management.model.Role;
import soft.transport.management.model.User;
import soft.transport.management.repository.RoleRepository;
import soft.transport.management.repository.UsersRepository;
import soft.transport.management.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UsersServiceImpl implements UserDetailsService, UsersService {

    @Autowired
    UsersRepository usersRepository;
    @Autowired
    RoleRepository roleRepository;

    @Override
    public void addUser(User user) {
        usersRepository.save(user);
    }

    @Override
    public void updateUser(User user) {
        usersRepository.save(user);
    }

    @Override
    public User getUser(Long id) {
        return usersRepository.getOne(id);
    }

    @Override
    public List<User> getAllUsers() {
        return usersRepository.findAll();
    }

    @Override
    public void deleteUsers(User user) {
        usersRepository.delete(user);
    }

    @Override
    public User findByUserName(String username) {
    	
        return usersRepository.findByUserName(username);
    	
    }


    @Override
    public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
    	soft.transport.management.model.User user = findByUserName(userName);
                
        if(user == null){
            throw new UsernameNotFoundException("Invalid username or password.");
        }

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        for(Role role : user.getRoles()) {
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getName().toString()));
        }
        return new org.springframework.security.core.userdetails.User(String.valueOf(user.getId()), user.getPassword(), grantedAuthorities);
    }

    /* private List<SimpleGrantedAuthority> getAuthority() {
        return Arrays.asList(new SimpleGrantedAuthority("ROLE_ADMIN"));
    } */

    @SuppressWarnings("unused")
    @Deprecated
    private List<SimpleGrantedAuthority> getAuthority(User user) {
        List<Role> roles = roleRepository.findRolesByUserList(user);
        List<String> roleList = new ArrayList<String>();

        for (Role role: roles){
            roleList.add(role.getName());
        }

        if (roleList != null){
            return Arrays.asList(new SimpleGrantedAuthority(roleList.toString()));
        } else {
          return null;
        }
    }
}
