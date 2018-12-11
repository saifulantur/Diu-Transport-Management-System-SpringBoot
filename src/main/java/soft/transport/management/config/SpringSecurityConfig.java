package soft.transport.management.config;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    /*@Autowired
    DataSource dataSource; */

    @Resource
    private UserDetailsService userDetailsService;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().requireCsrfProtectionMatcher(new AntPathRequestMatcher("**/login"))
                .and().authorizeRequests().antMatchers("/home").hasAnyRole("USER","ADMIN","DRIVER")
                .and().authorizeRequests().antMatchers("/test").hasRole("USER")
                .and().authorizeRequests().antMatchers("/studentinfo").authenticated()
                .and().authorizeRequests().antMatchers("/saveStudent").authenticated()
                .and().authorizeRequests().antMatchers("/viewAllStudent").authenticated()
                .and().authorizeRequests().antMatchers("/showStudentById").authenticated()
                
                .and().authorizeRequests().antMatchers("/view-all-brands").authenticated()
                .and().authorizeRequests().antMatchers("/view-rpt-brands").authenticated()
                .and().authorizeRequests().antMatchers("/brands").authenticated()
                .and().authorizeRequests().antMatchers("/saveBrands").authenticated()
                .and().authorizeRequests().antMatchers("/viewAllBrands").authenticated()
                .and().authorizeRequests().antMatchers("/delete-brand").authenticated()
                
                .and().authorizeRequests().antMatchers("/brandmodel").authenticated()
                .and().authorizeRequests().antMatchers("/saveBrandmodel").authenticated()
                
                .and().authorizeRequests().antMatchers("/transport_type").authenticated()
                .and().authorizeRequests().antMatchers("/saveTransportType").authenticated()
                .and().authorizeRequests().antMatchers("/viewAllTransportType").authenticated()
                
                .and().authorizeRequests().antMatchers("/transportinformation").authenticated()
                .and().authorizeRequests().antMatchers("/saveTransportInformation").authenticated()
                .and().authorizeRequests().antMatchers("/viewAllTransportInformation").authenticated()
                
                .and().authorizeRequests().antMatchers("/venue").authenticated()
                .and().authorizeRequests().antMatchers("/saveVene").authenticated()
                .and().authorizeRequests().antMatchers("/viewAllVenue").authenticated()
                
                .and().authorizeRequests().antMatchers("/institute").authenticated()
                .and().authorizeRequests().antMatchers("/save-institute").authenticated()
                .and().authorizeRequests().antMatchers("/viewAllInstitute").authenticated()
                
                .and().authorizeRequests().antMatchers("/transportschedule").authenticated()
                .and().authorizeRequests().antMatchers("/saveTransportSchedule").authenticated()
                .and().authorizeRequests().antMatchers("/viewAllTransportSchedule").authenticated()
                
                .and().authorizeRequests().antMatchers("/transportrequisition").authenticated()
                .and().authorizeRequests().antMatchers("/saveTransportRequisition").authenticated()
                .and().authorizeRequests().antMatchers("/viewTransportRequisition").authenticated()
                
                .and().authorizeRequests().antMatchers("/transport-requisition-approval").authenticated()
                .and().authorizeRequests().antMatchers("/update-requisition").authenticated()
                .and().authorizeRequests().antMatchers("/view-transport-reuisition-rejected").authenticated()
                
                .and().authorizeRequests().antMatchers("/transport-assign").authenticated()
                
                .and().authorizeRequests().antMatchers("/generaltravelinformation").authenticated()
                .and().authorizeRequests().antMatchers("/saveGeneralTravelInformation").authenticated()
                
                .and().authorizeRequests().antMatchers("/view-scheduled-transport-information").authenticated()
                .and().authorizeRequests().antMatchers("/saveScheduledTravelInfo").authenticated()
                .and().authorizeRequests().antMatchers("/viewAllScheduledInfo").authenticated()
                .and().authorizeRequests().antMatchers("/viewTransportScheduleByFkTransportId").authenticated()
                
                
                /* Test case Start*/
                .and().authorizeRequests().antMatchers("/viewtestcase").authenticated()
                /*Test Case End*/
                .and().authorizeRequests().antMatchers("/bill").authenticated()
                .and().authorizeRequests().antMatchers("/saveBilling").authenticated()
                .and().authorizeRequests().antMatchers("/viewAllBilling").authenticated()
                
                .and().authorizeRequests().antMatchers("/driver").hasRole("DRIVER")
                .and().authorizeRequests().antMatchers("/driverinformation").authenticated()
                .and().authorizeRequests().antMatchers("/saveDriver").authenticated()
                .and().authorizeRequests().antMatchers("/viewAllDriver").authenticated()
                
                .and().authorizeRequests().antMatchers("/helperinformation").authenticated()
                .and().authorizeRequests().antMatchers("/saveHelper").authenticated()
                .and().authorizeRequests().antMatchers("/viewAllHelper").authenticated()
                
                .and().authorizeRequests().antMatchers("/index").hasRole("USER")
                .and().authorizeRequests().antMatchers("/userregistration").hasAnyRole("USER","ADMIN")
                .and().authorizeRequests().antMatchers("/saveUser").permitAll()
                .and().authorizeRequests().antMatchers("/showAllUser").authenticated()
                .and().authorizeRequests().antMatchers("/showUserByName").authenticated()
                
                /*
                 * Report Section
                 */
                .and().authorizeRequests().antMatchers("/rpt-university-bus-schedule").permitAll()
                .and().authorizeRequests().antMatchers("/view-all-University-bus-schedule").permitAll()
                
                
                .and().formLogin().defaultSuccessUrl("/home").loginPage("/login").permitAll()             
                .and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login");
    }

/*    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.inMemoryAuthentication().withUser("khan").password("{noop}123456").roles("USER");
    }

    @Autowired
    public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
        System.out.println("coming here");
        auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("select username,password,enabled from users where username=?")
                .authoritiesByUsernameQuery("select username,name as role from role, users where role.fkUserId = users.id and username=?").passwordEncoder(new BCryptPasswordEncoder());
    } */

    @Bean
    public PasswordEncoder passwordEncoder(){
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        return passwordEncoder;
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers("/*.css");
        web.ignoring().antMatchers("/*.js");
    }
}
