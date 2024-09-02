document.addEventListener('DOMContentLoaded', () => {
  initializeToasts();
  initializeTaskPopup();
  initializeFlatpickr();
  initializeRemoveButtons();
});

const initializeToasts = () => {
  const toasts = document.querySelectorAll('.flash-toast');
  toasts.forEach((toast) => {
    showToast(toast);
  });
};

const showToast = (toast) => {
  setTimeout(() => {
    toast.classList.add('show');
  }, 100);

  setTimeout(() => {
    hideToast(toast);
  }, 3000);
};

const hideToast = (toast) => {
  toast.classList.remove('show');
  setTimeout(() => {
    toast.remove();
  }, 400);
};

const initializeTaskPopup = () => {
  const addTaskBtn = document.getElementById('add-task-btn');
  const closePopupBtn = document.getElementById('close-popup-btn');
  const newTaskPopup = document.getElementById('add-task-popup');

  addTaskBtn.addEventListener('click', () => {
    newTaskPopup.classList.remove('hidden');
    newTaskPopup.style.display = 'block';
  });

  closePopupBtn.addEventListener('click', () => {
    newTaskPopup.classList.add('hidden');
    newTaskPopup.style.display = 'none';
  });
};

const initializeFlatpickr = () => {
  flatpickr("#task_due_date", {
    enableTime: false,
    dateFormat: "Y-m-d",
    minDate: "today"
  });
};

const initializeRemoveButtons = () => {
  const removeButtons = document.querySelectorAll('.remove-task-btn');

  removeButtons.forEach(button => {
    const isCompleted = button.dataset.completed === 'true';
    button.disabled = !isCompleted;
    if (!isCompleted) {
      button.classList.add('disabled-remove-btn');
    }
  });
};
