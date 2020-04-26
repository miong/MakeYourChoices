export declare namespace Debug {
    function AssertType<T>(variable: any, type: new () => T, message: string): void | never;
    function Assert(condition: boolean, message?: string): void | never;
}
