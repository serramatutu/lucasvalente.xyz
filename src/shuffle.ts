/**
 * Shuffle an array
 * @param arr The input array
 */
export function shuffle<T>(arr: T[]) {
    if (arr.length <= 1) {
        return;
    }

    const rounds = arr.length * 2;

    for (let i = 0; i < rounds; i++) {
        const a = Math.floor(Math.random() * arr.length);
        const b = Math.floor(Math.random() * arr.length);

        const tmp = arr[a];
        arr[a] = arr[b];
        arr[b] = tmp;
    }
}