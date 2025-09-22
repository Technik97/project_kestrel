fn main() {
    println!("Fibonacci Sequence");

    let n = 10;
    let mut sequence = vec![0, 1];

    for i in 2..n {
        let next = sequence[i - 1] + sequence[i - 2];
        sequence.push(next);
    }

    println!("First {} Fibonacci numbers: {:?}", n, sequence);
}
