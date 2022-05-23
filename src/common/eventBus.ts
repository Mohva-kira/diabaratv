export const eventBus = {
    on(event: any, callback: any) {
        // ...
    },
    dispatch(event: any, data: any) {
        // ...
    },
    remove(event: any, callback: any) {
        // ...
        document.removeEventListener(event, callback);
    },
};
