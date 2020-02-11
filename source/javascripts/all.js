console.log('Hi 👋.');
console.log('Find the source code for this website here:');
console.log('https://github.com/shukerov/shukerov.github.io');

markActiveTab();

// active tab
function markActiveTab() {
  const mainContent = document.getElementsByTagName('main')[0];
  const activeNavItemName = 'nav-item-' + mainContent.id;
  const activeNavItem = document.getElementById(activeNavItemName);

  activeNavItem.classList.add('nav-active-item');
}
