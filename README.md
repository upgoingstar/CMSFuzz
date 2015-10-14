# CMSFuzz
Fuzzer for wordpress, cold fusion, drupal, joomla, and phpnuke.
This project uses [secLists] (https://github.com/danielmiessler/SecLists/tree/master/Discovery/Web_Content/CMS)


##Example output
Please enter target URL (example: hackme.org)
blog.example.com
What are we fuzzing?
          1:   Wordpress
          2:   Cold Fusion
          3:   Drupal
          4:   Joomla
          5:   PHP-Nuke
          6:   Magento
          7:   Sharepoint
          8:   Common PHP Files
          9:   Look for backup files
          10:  Apache Default Files
          11:  IIS Default Files
          12:  Miscellaneous Files (SVN, robots, etc).
          0:  Other

Please enter an option:
1
fuzzing blog.example.com looking for Wordpress files.
-----------------------------------------------------------------
REDIRECTION AT: blog.example.com/wp-activate.php
REDIRECTION AT: blog.example.com/wp-admin/
200 FOUND AT: blog.example.com/wp-admin/admin-ajax.php
200 FOUND AT: blog.example.com/wp-admin/admin-footer.php
REDIRECTION AT: blog.example.com/wp-admin/admin.php
200 FOUND AT: blog.example.com/wp-admin/admin-post.php
REDIRECTION AT: blog.example.com/wp-admin/async-upload.php
REDIRECTION AT: blog.example.com/wp-admin/comment.php
FORBIDDEN AT: blog.example.com/wp-admin/css/
200 FOUND AT: blog.example.com/wp-admin/css/dashboard.css
200 FOUND AT: blog.example.com/wp-admin/css/dashboard-rtl.css
200 FOUND AT: blog.example.com/wp-admin/css/farbtastic.css
200 FOUND AT: blog.example.com/wp-admin/css/farbtastic-rtl.css
200 FOUND AT: blog.example.com/wp-admin/css/ie.css
200 FOUND AT: blog.example.com/wp-admin/css/ie-rtl.css
200 FOUND AT: blog.example.com/wp-admin/css/install.css
200 FOUND AT: blog.example.com/wp-admin/css/install-rtl.css
200 FOUND AT: blog.example.com/wp-admin/css/login.css
200 FOUND AT: blog.example.com/wp-admin/css/login-rtl.css
200 FOUND AT: blog.example.com/wp-admin/css/media.css
