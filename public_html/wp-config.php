<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'development');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'zerG|2#+{a;e(0&u&nL}vb-^{xl8*ptnA8!6{`:z*V4 K,@{n^4zJ4`@-~Xt6_]>');
define('SECURE_AUTH_KEY',  'Qhb%cI+wo;L@Z>(x+2^66#ocr3hEZc2_6}m|:$VOrlX6FLST!<ox9DznqD<pXyN_');
define('LOGGED_IN_KEY',    '2&J.f{U6R:?KBn!$]/f#C4c.F^$sTG8+66N)&=H~lbYT:S~=C{91mrkr.ZF&$vd~');
define('NONCE_KEY',        'J)tc{C&ZqbDCK0h;1!VmyXDrU}96rG[n@GLBS!)oXAdy~,R4wOS35jj!vDvDK2%k');
define('AUTH_SALT',        'kA)mQN~.!/8|ko=Rk.w(J*cGvg!VVJk,+KhNu@z#+Oyw_~(#4R<A$*/8$#j8Q|+Q');
define('SECURE_AUTH_SALT', 'QA,up;{s+G}nFj0*Uf+MDW7=&jgW0%gTNeIgmi*aMYhGlySTo7}W-{CD|OFnp=DD');
define('LOGGED_IN_SALT',   'L8,l{i:80{o$T#8o7<UA;iCVbcGnJm`o&dq*H;^T%`xPUwKiAKE]Lm/q]$!Q;;aF');
define('NONCE_SALT',       '*?U`[?g6;+@_gV(TY8N1m1HkA7>w${4~lCc=WMb+MI)UNEPjM@B^!<=>hgHE2LNz');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
